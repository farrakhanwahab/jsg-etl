#!/usr/bin/env python3
"""
Data Quality Checker for Judicial Service ETL Pipeline
Validates data quality before and after ETL processing
"""

import pandas as pd
import mysql.connector
import logging
from datetime import datetime
import json
from typing import Dict, List, Tuple

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

class DataQualityChecker:
    """Data quality validation and reporting"""
    
    def __init__(self, db_config: Dict = None):
        self.db_config = db_config or {
            'host': 'localhost',
            'user': 'root',
            'password': '',
            'database': 'judicial_dw'
        }
        self.quality_report = {
            'timestamp': datetime.now().isoformat(),
            'checks_performed': [],
            'issues_found': [],
            'recommendations': []
        }
    
    def check_data_completeness(self, df: pd.DataFrame, table_name: str) -> Dict:
        """Check for missing values and data completeness"""
        completeness_report = {
            'table': table_name,
            'total_rows': len(df),
            'missing_values': {},
            'completeness_score': 0.0
        }
        
        total_cells = len(df) * len(df.columns)
        missing_cells = 0
        
        for column in df.columns:
            missing_count = df[column].isnull().sum()
            missing_percentage = (missing_count / len(df)) * 100
            completeness_report['missing_values'][column] = {
                'count': int(missing_count),
                'percentage': round(missing_percentage, 2)
            }
            missing_cells += missing_count
            
            if missing_percentage > 20:
                self.quality_report['issues_found'].append({
                    'type': 'high_missing_data',
                    'table': table_name,
                    'column': column,
                    'percentage': missing_percentage
                })
        
        completeness_report['completeness_score'] = round(((total_cells - missing_cells) / total_cells) * 100, 2)
        
        return completeness_report
    
    def check_data_consistency(self, df: pd.DataFrame, table_name: str) -> Dict:
        """Check data consistency and format"""
        consistency_report = {
            'table': table_name,
            'duplicate_rows': len(df[df.duplicated()]),
            'unique_values': {},
            'data_types': {}
        }
        
        for column in df.columns:
            consistency_report['unique_values'][column] = df[column].nunique()
            consistency_report['data_types'][column] = str(df[column].dtype)
        
        # Check for duplicates
        if consistency_report['duplicate_rows'] > 0:
            self.quality_report['issues_found'].append({
                'type': 'duplicate_data',
                'table': table_name,
                'count': consistency_report['duplicate_rows']
            })
        
        return consistency_report
    
    def check_business_rules(self, df: pd.DataFrame, table_name: str) -> Dict:
        """Check business rules and constraints"""
        business_rules_report = {
            'table': table_name,
            'violations': []
        }
        
        if table_name == 'cases':
            # Business rules for cases table
            if 'filing_date' in df.columns and 'resolution_date' in df.columns:
                # Check if resolution date is after filing date
                invalid_dates = df[
                    (df['filing_date'].notna()) & 
                    (df['resolution_date'].notna()) & 
                    (df['resolution_date'] < df['filing_date'])
                ]
                if len(invalid_dates) > 0:
                    business_rules_report['violations'].append({
                        'rule': 'resolution_date_after_filing_date',
                        'count': len(invalid_dates)
                    })
            
            # Check for negative amounts
            if 'amount' in df.columns:
                negative_amounts = df[df['amount'] < 0]
                if len(negative_amounts) > 0:
                    business_rules_report['violations'].append({
                        'rule': 'negative_amount',
                        'count': len(negative_amounts)
                    })
        
        elif table_name == 'dim_judges':
            # Business rules for judges table
            if 'experience_years' in df.columns:
                invalid_experience = df[df['experience_years'] < 0]
                if len(invalid_experience) > 0:
                    business_rules_report['violations'].append({
                        'rule': 'negative_experience_years',
                        'count': len(invalid_experience)
                    })
        
        return business_rules_report
    
    def check_database_integrity(self) -> Dict:
        """Check database referential integrity"""
        try:
            connection = mysql.connector.connect(**self.db_config)
            cursor = connection.cursor(dictionary=True)
            
            integrity_report = {
                'foreign_key_checks': [],
                'data_counts': {}
            }
            
            # Check table row counts
            tables = ['cases', 'dim_case_type', 'dim_courts', 'dim_judges', 'dim_outcome_types', 'dim_parties_involved']
            for table in tables:
                cursor.execute(f"SELECT COUNT(*) as count FROM {table}")
                result = cursor.fetchone()
                integrity_report['data_counts'][table] = result['count']
            
            # Check foreign key integrity
            cursor.execute("""
                SELECT COUNT(*) as orphaned_cases
                FROM cases c
                LEFT JOIN dim_courts dc ON c.Court_Record_ID = dc.Court_ID
                WHERE c.Court_Record_ID IS NOT NULL AND dc.Court_ID IS NULL
            """)
            orphaned_cases = cursor.fetchone()['orphaned_cases']
            
            if orphaned_cases > 0:
                integrity_report['foreign_key_checks'].append({
                    'issue': 'orphaned_court_references',
                    'count': orphaned_cases
                })
            
            cursor.close()
            connection.close()
            
            return integrity_report
            
        except Exception as e:
            logger.error(f"Error checking database integrity: {e}")
            return {'error': str(e)}
    
    def generate_quality_report(self) -> Dict:
        """Generate comprehensive data quality report"""
        report = {
            'timestamp': datetime.now().isoformat(),
            'summary': {
                'total_issues': len(self.quality_report['issues_found']),
                'severity_levels': {
                    'high': len([i for i in self.quality_report['issues_found'] if i.get('percentage', 0) > 20]),
                    'medium': len([i for i in self.quality_report['issues_found'] if 10 < i.get('percentage', 0) <= 20]),
                    'low': len([i for i in self.quality_report['issues_found'] if i.get('percentage', 0) <= 10])
                }
            },
            'issues': self.quality_report['issues_found'],
            'recommendations': self.quality_report['recommendations']
        }
        
        # Add recommendations based on issues found
        if any(i['type'] == 'high_missing_data' for i in self.quality_report['issues_found']):
            report['recommendations'].append("Review data sources for missing values and implement data validation")
        
        if any(i['type'] == 'duplicate_data' for i in self.quality_report['issues_found']):
            report['recommendations'].append("Implement deduplication logic in ETL pipeline")
        
        return report
    
    def save_quality_report(self, filename: str = 'data_quality_report.json'):
        """Save quality report to file"""
        report = self.generate_quality_report()
        with open(filename, 'w') as f:
            json.dump(report, f, indent=2)
        logger.info(f"📊 Data quality report saved to {filename}")

def main():
    """Run data quality checks"""
    print("🔍 Data Quality Checker for Judicial Service")
    print("=" * 50)
    
    checker = DataQualityChecker()
    
    # Check database integrity
    print("🔍 Checking database integrity...")
    integrity_report = checker.check_database_integrity()
    
    if 'error' not in integrity_report:
        print("✅ Database integrity check completed")
        print(f"📊 Total cases: {integrity_report['data_counts'].get('cases', 0)}")
        print(f"📊 Total judges: {integrity_report['data_counts'].get('dim_judges', 0)}")
        print(f"📊 Total courts: {integrity_report['data_counts'].get('dim_courts', 0)}")
    else:
        print(f"❌ Database integrity check failed: {integrity_report['error']}")
    
    # Generate and save report
    checker.save_quality_report()
    print("📋 Data quality report generated")

if __name__ == "__main__":
    main() 