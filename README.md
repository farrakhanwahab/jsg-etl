# Complete Judicial Service ETL Pipeline & Analytics Dashboard

A comprehensive Extract, Transform, Load (ETL) solution with modern analytics dashboard for the Judicial Service of Ghana. This project provides a complete data warehousing and business intelligence solution.

## What This Project Provides

### Complete ETL Pipeline
- Extract: Automated data extraction from multiple sources (CSV, Excel, JSON)
- Transform: Data cleaning, standardization, and business logic application
- Load: Automated loading into MySQL data warehouse
- Quality: Data quality validation and reporting

### Modern Analytics Dashboard
- Beautiful UI: Modern, responsive design with dark/light themes
- Interactive Charts: Real-time visualizations using Chart.js
- Real-time Data: Live data from your MySQL data warehouse
- Multiple Views: Overview, Cases, Courts, Judges, and Trends


## Quick Start (Complete Pipeline)

### Prerequisites
- Python 3.9+
- XAMPP (MySQL running)
- Judicial data files in `Data/`, `mock_data/`, or `generated_data/` folders

### One-Command Setup

1. Start XAMPP MySQL and ensure it's running

2. Run the complete pipeline:
   ```bash
   ./run_complete_pipeline.sh
   ```

3. Open your browser:
   ```
   http://localhost:8080
   ```

This single command will:
- Install all dependencies
- Run the complete ETL pipeline
- Perform data quality checks
- Start the modern dashboard


## Individual Components

### ETL Pipeline Only
```bash
python3 etl_pipeline.py
```

### Data Quality Check Only
```bash
python3 data_quality_checker.py
```

### Dashboard Only
```bash
cd modern_dashboard
./start_dashboard.sh
```


## ETL Pipeline Features

### Data Extraction
- Multiple Formats: CSV, Excel, JSON support
- Multiple Sources: Data/, mock_data/, generated_data/ folders
- Error Handling: Robust error handling and logging
- Flexible: Easy to add new data sources

### Data Transformation
- Cleaning: Handle missing values, duplicates, format standardization
- Business Logic: Calculate resolution times, validate dates, amounts
- Standardization: Consistent column names, data types
- Audit Trail: Track creation and update timestamps

### Data Loading
- MySQL Integration: Direct loading into judicial_dw database
- Referential Integrity: Maintain foreign key relationships
- Batch Processing: Efficient bulk data loading
- Error Recovery: Rollback on failures

### Data Quality
- Completeness Checks: Missing value analysis
- Consistency Validation: Duplicate detection, format validation
- Business Rules: Date logic, amount validation, experience checks
- Integrity Checks: Foreign key validation
- Reporting: Detailed quality reports with recommendations


## Dashboard Features

### Modern Design
- Responsive Layout: Works on desktop, tablet, mobile
- Dark/Light Themes: Toggle between themes
- Smooth Animations: Hover effects and transitions
- Professional UI: Clean, modern interface

### Interactive Analytics
- Real-time Charts: Live data from MySQL
- Multiple Views: Overview, Cases, Courts, Judges, Trends
- Interactive Elements: Clickable charts and navigation
- Auto-refresh: Charts update automatically

### Comprehensive Metrics
- Key Performance Indicators: Resolution rates, processing times
- Case Analysis: Outcomes, payment status, resolution times
- Court Performance: Cases per court, location distribution
- Judge Analytics: Experience distribution, assignments
- Trend Analysis: Historical filing trends


## Performance & Scalability

- Efficient Processing: Batch operations for large datasets
- Memory Management: Streaming data processing
- Error Recovery: Robust error handling and logging
- Monitoring: Comprehensive logging and metrics



By [Farrakhan](https://github.com/farrakhanwahab)

