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

---

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

---

## Project Structure

```
etl_project/
├── etl_pipeline.py              # Complete ETL pipeline
├── data_quality_checker.py      # Data quality validation
├── run_complete_pipeline.sh     # One-command startup script
├── judicial_dw.sql              # Database schema
├── modern_dashboard/            # Modern web dashboard
│   ├── index.html              # Dashboard interface
│   ├── styles.css              # Modern styling
│   ├── script.js               # Dashboard functionality
│   ├── server.py               # Flask backend API
│   └── start_dashboard.sh      # Dashboard-only startup
├── Data/                       # Source data files
├── mock_data/                  # Mock data for testing
├── generated_data/             # Generated data files
└── README.md                   # This file
```

---

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

---

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

---

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

---

## API Endpoints

The dashboard connects to these REST API endpoints:

- GET /api/metrics - Dashboard key metrics
- GET /api/charts/status - Case status distribution
- GET /api/charts/types - Case types distribution
- GET /api/charts/outcomes - Case outcomes by type
- GET /api/charts/payment - Payment status distribution
- GET /api/charts/resolution-time - Resolution time analysis
- GET /api/charts/courts - Cases per court
- GET /api/charts/locations - Court location distribution
- GET /api/charts/experience - Judge experience distribution
- GET /api/charts/judge-courts - Judges per court
- GET /api/charts/trends - Filing trends over time

---

## Data Quality Reports

The system generates comprehensive data quality reports:

- Completeness Analysis: Missing value percentages
- Consistency Checks: Duplicate detection, format validation
- Business Rule Validation: Date logic, amount validation
- Referential Integrity: Foreign key validation
- Recommendations: Actionable improvement suggestions

Reports are saved as `data_quality_report.json` and `etl_metrics.json`.

---

## Customization

### ETL Pipeline
- Add Data Sources: Modify `data_sources` in `etl_pipeline.py`
- Business Rules: Add validation logic in `transform_*` methods
- Data Quality: Extend checks in `data_quality_checker.py`

### Dashboard
- Design: Edit `modern_dashboard/styles.css`
- Charts: Modify `modern_dashboard/script.js`
- API: Add endpoints in `modern_dashboard/server.py`

---

## Troubleshooting

### ETL Pipeline Issues
- Check MySQL connection and database existence
- Verify data files exist in source folders
- Review `etl_pipeline.log` for detailed errors
- Ensure XAMPP MySQL is running

### Dashboard Issues
- Verify Flask server is running on port 8080
- Check browser console for JavaScript errors
- Ensure database has data (run ETL first)
- Check API endpoints are responding

### Data Quality Issues
- Review `data_quality_report.json` for specific issues
- Check source data for missing or invalid values
- Verify business rules in transformation logic

### Data Consistency

- The dashboard always displays live data directly from the MySQL database, which is loaded by the ETL pipeline. No static or mock data is used in the dashboard.
- Ensure your MySQL schema matches the ETL data types. For example, `dim_outcome_types.Outcome_Type_ID` is now `VARCHAR(50)` to support UUIDs from the ETL process.

### Troubleshooting

- If you see 'data truncated' errors during ETL, check that your MySQL schema column types (e.g., VARCHAR vs INT) match the data in your CSVs or source files.

---

## Performance & Scalability

- Efficient Processing: Batch operations for large datasets
- Memory Management: Streaming data processing
- Error Recovery: Robust error handling and logging
- Monitoring: Comprehensive logging and metrics

---

## Security & Best Practices

- Local Development: Configured for local development
- Database Security: Uses local MySQL credentials
- Input Validation: Data validation and sanitization
- Error Handling: Secure error messages

---

## Support

For issues or questions:
1. Check the troubleshooting section
2. Review log files (`etl_pipeline.log`)
3. Verify all prerequisites are met
4. Check data quality reports for issues

---

Enjoy your complete judicial analytics solution!

