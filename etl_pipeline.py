#!/usr/bin/env python3
"""
ETL Pipeline for Judicial Service of Ghana
Extract, Transform, Load process for data warehousing and analytics
"""

import pandas as pd
import mysql.connector
from mysql.connector import Error
import logging
import os
import json
from datetime import datetime, timedelta
import numpy as np
from typing import Dict, List, Optional
import warnings
warnings.filterwarnings('ignore')

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler('etl_pipeline.log'),
        logging.StreamHandler()
    ]
)
logger = logging.getLogger(__name__)

class JudicialETLPipeline:
    """Complete ETL pipeline for Judicial Service data"""
    
    def __init__(self, db_config: Dict = None):
        self.db_config = db_config or {
            'host': 'localhost',
            'user': 'root',
            'password': '',
            'database': 'judicial_dw'
        }
        self.connection = None
        self.data_sources = {
            'cases': ['Data/cases.csv', 'Data_Point/cases.csv', 'generated_data/cases.csv', 'mock_data/cases.csv'],
            'case_types': ['Data/dim_case_type.csv', 'Data_Point/dim_case_type.csv', 'generated_data/dim_case_type.csv', 'mock_data/dim_case_type.csv'],
            'courts': ['Data/dim_courts.csv', 'Data_Point/dim_courts.csv', 'generated_data/dim_courts.csv', 'mock_data/dim_courts.csv'],
            'judges': ['Data/dim_judges.csv', 'Data_Point/dim_judges.csv', 'generated_data/dim_judges.csv', 'mock_data/dim_judges.csv'],
            'outcomes': ['Data/dim_outcome_types.csv', 'Data_Point/dim_outcome_types.csv', 'generated_data/dim_outcome_types.csv', 'mock_data/dim_outcome_types.csv'],
            'parties': ['Data/dim_parties_involved.csv', 'Data_Point/dim_parties_involved.csv', 'generated_data/dim_parties_involved.csv', 'mock_data/dim_parties_involved.csv']
        }
        
    def connect_to_database(self) -> bool:
        """Establish connection to MySQL database"""
        try:
            self.connection = mysql.connector.connect(**self.db_config)
            logger.info("✅ Successfully connected to MySQL database")
            return True
        except Error as e:
            logger.error(f"❌ Error connecting to MySQL: {e}")
            return False
    
    def disconnect_from_database(self):
        """Close database connection"""
        if self.connection and self.connection.is_connected():
            self.connection.close()
            logger.info("🔌 Database connection closed")
    
    def extract_data(self, file_path: str) -> Optional[pd.DataFrame]:
        """Extract data from various file formats"""
        try:
            if file_path.endswith('.csv'):
                df = pd.read_csv(file_path)
            elif file_path.endswith('.xlsx'):
                df = pd.read_excel(file_path)
            elif file_path.endswith('.json'):
                df = pd.read_json(file_path)
            else:
                logger.warning(f"⚠️ Unsupported file format: {file_path}")
                return None
            
            logger.info(f"📁 Extracted {len(df)} rows from {file_path}")
            return df
        except Exception as e:
            logger.error(f"❌ Error extracting data from {file_path}: {e}")
            return None
    
    def transform_cases_data(self, df: pd.DataFrame) -> pd.DataFrame:
        """Transform cases data with business logic and column mapping for foreign keys"""
        try:
            # Create a copy to avoid modifying original
            df_transformed = df.copy()
            
            # Standardize column names
            df_transformed.columns = [col.strip().replace(' ', '_').lower() for col in df_transformed.columns]
            
            # Map foreign key columns to match DB schema
            fk_map = {
                'judge_id': 'judge_record_id',
                'court_id': 'court_record_id',
                'party_id': 'party_record_id'
            }
            for src, dest in fk_map.items():
                if src in df_transformed.columns and dest not in df_transformed.columns:
                    df_transformed[dest] = df_transformed[src]
                    df_transformed = df_transformed.drop(columns=[src])
            
            # Convert foreign key columns to integers and handle invalid values
            fk_columns = ['court_record_id', 'judge_record_id', 'party_record_id']
            for col in fk_columns:
                if col in df_transformed.columns:
                    # Convert to numeric, invalid values become NaN
                    df_transformed[col] = pd.to_numeric(df_transformed[col], errors='coerce')
                    # Fill NaN with 0 or a default value
                    df_transformed[col] = df_transformed[col].fillna(0).astype(int)
            
            # Handle missing values
            df_transformed['case_status'] = df_transformed['case_status'].fillna('Pending')
            df_transformed['outcome_type'] = df_transformed['outcome_type'].fillna('Unknown')
            df_transformed['payment_status'] = df_transformed['payment_status'].fillna('Pending')
            
            # Convert dates
            date_columns = ['filing_date', 'hearing_date', 'resolution_date']
            for col in date_columns:
                if col in df_transformed.columns:
                    df_transformed[col] = pd.to_datetime(df_transformed[col], errors='coerce')
            
            # Calculate resolution time
            if 'filing_date' in df_transformed.columns and 'resolution_date' in df_transformed.columns:
                df_transformed['resolution_time'] = (
                    df_transformed['resolution_date'] - df_transformed['filing_date']
                ).dt.days
            
            # Clean monetary values
            if 'amount' in df_transformed.columns:
                df_transformed['amount'] = pd.to_numeric(df_transformed['amount'], errors='coerce').fillna(0)
            
            # Generate unique case IDs if not present
            if 'case_id' not in df_transformed.columns:
                df_transformed['case_id'] = range(1, len(df_transformed) + 1)
            
            logger.info(f"🔄 Transformed {len(df_transformed)} cases records")
            return df_transformed
            
        except Exception as e:
            logger.error(f"❌ Error transforming cases data: {e}")
            return df
    
    def transform_dimension_data(self, df: pd.DataFrame, dimension_type: str) -> pd.DataFrame:
        """Transform dimension table data"""
        try:
            df_transformed = df.copy()
            
            # Standardize column names
            df_transformed.columns = [col.strip().replace(' ', '_').lower() for col in df_transformed.columns]
            
            # Dimension-specific transformations
            if dimension_type == 'judges':
                # Ensure experience years is numeric
                if 'experience_years' in df_transformed.columns:
                    df_transformed['experience_years'] = pd.to_numeric(df_transformed['experience_years'], errors='coerce').fillna(0)
            
            elif dimension_type == 'courts':
                # Standardize court locations
                if 'court_location' in df_transformed.columns:
                    df_transformed['court_location'] = df_transformed['court_location'].str.title()
            
            logger.info(f"🔄 Transformed {len(df_transformed)} {dimension_type} records")
            return df_transformed
            
        except Exception as e:
            logger.error(f"❌ Error transforming {dimension_type} data: {e}")
            return df
    
    def load_data_to_database(self, df: pd.DataFrame, table_name: str) -> bool:
        """Load transformed data into MySQL database, aligning columns with database schema."""
        try:
            if self.connection is None or not self.connection.is_connected():
                logger.error("❌ No database connection available")
                return False

            logger.info(f"📊 Processing {table_name} - Original columns: {list(df.columns)}")

            # Get database column structure
            db_columns_query = f"SHOW COLUMNS FROM {table_name}"
            cursor = self.connection.cursor()
            cursor.execute(db_columns_query)
            db_columns = [row[0] for row in cursor.fetchall()]
            logger.info(f"Database columns for {table_name}: {db_columns}")

            # Only keep columns that exist in the DB table (case-insensitive)
            df = df[[col for col in df.columns if col.lower() in [c.lower() for c in db_columns]]]
            logger.info(f"Columns after filtering: {list(df.columns)}")

            # Reorder columns to match DB table
            ordered_cols = [col for col in db_columns if col.lower() in [c.lower() for c in df.columns]]
            col_map = {c.lower(): c for c in df.columns}
            df = df[[col_map[c.lower()] for c in ordered_cols]]

            # Prepare data for insertion
            columns = df.columns.tolist()
            placeholders = ', '.join(['%s'] * len(columns))
            insert_query = f"INSERT INTO {table_name} ({', '.join(columns)}) VALUES ({placeholders})"

            # Clear existing data (for incremental loads, you might want to modify this)
            cursor.execute(f"DELETE FROM {table_name}")
            logger.info(f"🗑️ Cleared existing data from {table_name}")

            # Convert DataFrame to list of tuples
            data_to_insert = [tuple(row) for row in df.values]

            # Execute batch insert
            cursor.executemany(insert_query, data_to_insert)
            self.connection.commit()

            logger.info(f"✅ Successfully loaded {len(df)} records into {table_name}")
            cursor.close()
            return True

        except Error as e:
            logger.error(f"❌ Error loading data to {table_name}: {e}")
            if self.connection:
                self.connection.rollback()
            return False
        except Exception as e:
            logger.error(f"❌ General error loading data to {table_name}: {e}")
            if self.connection:
                self.connection.rollback()
            return False
    
    def create_data_warehouse_tables(self) -> bool:
        """Create data warehouse tables if they don't exist"""
        try:
            if not self.connect_to_database():
                return False
            
            cursor = self.connection.cursor()
            
            # Create tables based on the judicial_dw.sql schema
            tables_sql = {
                'dim_case_type': """
                    CREATE TABLE IF NOT EXISTS dim_case_type (
                        Case_Type_ID INT PRIMARY KEY AUTO_INCREMENT,
                        Case_Type VARCHAR(100) NOT NULL,
                        Description TEXT
                    )
                """,
                
                'dim_courts': """
                    CREATE TABLE IF NOT EXISTS dim_courts (
                        Court_ID INT PRIMARY KEY AUTO_INCREMENT,
                        Court_Name VARCHAR(100) NOT NULL,
                        Court_Location VARCHAR(100),
                        Court_Type VARCHAR(50)
                    )
                """,
                
                'dim_judges': """
                    CREATE TABLE IF NOT EXISTS dim_judges (
                        Judge_ID INT PRIMARY KEY AUTO_INCREMENT,
                        Judge_Name VARCHAR(100) NOT NULL,
                        Experience_Years INT,
                        Assigned_Court VARCHAR(100)
                    )
                """,
                
                'dim_outcome_types': """
                    CREATE TABLE IF NOT EXISTS dim_outcome_types (
                        Outcome_ID INT PRIMARY KEY AUTO_INCREMENT,
                        Outcome_Type VARCHAR(100) NOT NULL,
                        Description TEXT
                    )
                """,
                
                'dim_parties_involved': """
                    CREATE TABLE IF NOT EXISTS dim_parties_involved (
                        Party_ID INT PRIMARY KEY AUTO_INCREMENT,
                        Party_Name VARCHAR(100) NOT NULL,
                        Party_Type VARCHAR(50),
                        Contact_Info TEXT
                    )
                """,
                
                'cases': """
                    CREATE TABLE IF NOT EXISTS cases (
                        Case_ID INT PRIMARY KEY AUTO_INCREMENT,
                        Case_Number VARCHAR(50) UNIQUE,
                        Case_Type VARCHAR(100),
                        Case_Status VARCHAR(50),
                        Filing_Date DATE,
                        Hearing_Date DATE,
                        Resolution_Date DATE,
                        Resolution_Time INT,
                        Outcome_Type VARCHAR(100),
                        Amount DECIMAL(15,2),
                        Payment_Status VARCHAR(50),
                        Court_Record_ID INT,
                        Judge_Record_ID INT,
                        Party_Record_ID INT,
                        FOREIGN KEY (Court_Record_ID) REFERENCES dim_courts(Court_ID),
                        FOREIGN KEY (Judge_Record_ID) REFERENCES dim_judges(Judge_ID),
                        FOREIGN KEY (Party_Record_ID) REFERENCES dim_parties_involved(Party_ID)
                    )
                """
            }
            
            for table_name, sql in tables_sql.items():
                cursor.execute(sql)
                logger.info(f"✅ Created/verified table: {table_name}")
            
            self.connection.commit()
            cursor.close()
            return True
            
        except Error as e:
            logger.error(f"❌ Error creating tables: {e}")
            return False
    
    def run_full_etl(self) -> bool:
        """Run the complete ETL pipeline"""
        logger.info("🚀 Starting Judicial Service ETL Pipeline...")
        
        try:
            # Step 1: Create database tables
            if not self.create_data_warehouse_tables():
                return False
            
            # Step 2: Extract and load dimension tables
            dimension_mapping = {
                'case_types': 'dim_case_type',
                'courts': 'dim_courts', 
                'judges': 'dim_judges',
                'outcomes': 'dim_outcome_types',
                'parties': 'dim_parties_involved'
            }
            
            for source_key, table_name in dimension_mapping.items():
                logger.info(f"📊 Processing {source_key}...")
                
                # Find available data source
                data_source = None
                for file_path in self.data_sources[source_key]:
                    if os.path.exists(file_path):
                        data_source = file_path
                        break
                
                if data_source:
                    # Extract
                    df = self.extract_data(data_source)
                    if df is not None:
                        # Transform
                        df_transformed = self.transform_dimension_data(df, source_key)
                        # Load
                        self.load_data_to_database(df_transformed, table_name)
                else:
                    logger.warning(f"⚠️ No data source found for {source_key}")
            
            # Step 3: Extract and load fact table (cases)
            logger.info("📊 Processing cases...")
            
            # Find available cases data source
            cases_source = None
            for file_path in self.data_sources['cases']:
                if os.path.exists(file_path):
                    cases_source = file_path
                    break
            
            if cases_source:
                # Extract
                df_cases = self.extract_data(cases_source)
                if df_cases is not None:
                    # Transform
                    df_cases_transformed = self.transform_cases_data(df_cases)
                    # Load
                    self.load_data_to_database(df_cases_transformed, 'cases')
            else:
                logger.warning("⚠️ No cases data source found")
            
            # Step 4: Generate ETL metrics
            self.generate_etl_metrics()
            
            logger.info("🎉 ETL Pipeline completed successfully!")
            return True
            
        except Exception as e:
            logger.error(f"❌ ETL Pipeline failed: {e}")
            return False
        finally:
            self.disconnect_from_database()
    
    def generate_etl_metrics(self):
        """Generate ETL execution metrics"""
        try:
            metrics = {
                'etl_execution_time': datetime.now().isoformat(),
                'status': 'completed',
                'tables_processed': list(self.data_sources.keys()),
                'data_sources_used': []
            }
            
            # Check which data sources were actually used
            for source_type, file_paths in self.data_sources.items():
                for file_path in file_paths:
                    if os.path.exists(file_path):
                        metrics['data_sources_used'].append(file_path)
                        break
            
            # Save metrics to file
            with open('etl_metrics.json', 'w') as f:
                json.dump(metrics, f, indent=2)
            
            logger.info("📊 ETL metrics generated and saved")
            
        except Exception as e:
            logger.error(f"❌ Error generating ETL metrics: {e}")

def main():
    """Main function to run the ETL pipeline"""
    print("🚀 Judicial Service ETL Pipeline")
    print("=" * 50)
    
    # Initialize ETL pipeline
    etl_pipeline = JudicialETLPipeline()
    
    # Run the complete ETL process
    success = etl_pipeline.run_full_etl()
    
    if success:
        print("\n✅ ETL Pipeline completed successfully!")
        print("📊 Your data warehouse is ready for analytics")
        print("🌐 Start the dashboard with: cd modern_dashboard && python3 server.py")
    else:
        print("\n❌ ETL Pipeline failed!")
        print("📋 Check the logs for detailed error information")

if __name__ == "__main__":
    main() 