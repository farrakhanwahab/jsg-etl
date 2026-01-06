#!/bin/bash

# Complete Judicial Service ETL Pipeline and Dashboard Startup Script

echo "🚀 Judicial Service Complete ETL Pipeline & Dashboard"
echo "=================================================="

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if Python is installed
print_status "Checking Python installation..."
if ! command -v python3 &> /dev/null; then
    print_error "Python 3 is not installed. Please install Python 3.9 or later."
    exit 1
fi

PYTHON_VERSION=$(python3 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
print_success "Python $PYTHON_VERSION found"

# Check if we're in the right directory
if [ ! -f "etl_pipeline.py" ]; then
    print_error "Please run this script from the project root directory (where etl_pipeline.py is located)"
    exit 1
fi

# Install required packages
print_status "Installing required packages..."
python3 -m pip install --break-system-packages pandas mysql-connector-python openpyxl tqdm

if [ $? -ne 0 ]; then
    print_error "Failed to install required packages"
    exit 1
fi

print_success "Required packages installed"

# Check MySQL connection (XAMPP)
print_status "Checking MySQL connection..."
python3 -c "
import mysql.connector
try:
    conn = mysql.connector.connect(
        host='localhost',
        user='root',
        password='',
        database='judicial_dw'
    )
    print('✅ MySQL connection successful!')
    conn.close()
except Exception as e:
    print('❌ MySQL connection failed:', e)
    print('💡 Make sure XAMPP MySQL is running and judicial_dw database exists')
    exit(1)
"

if [ $? -ne 0 ]; then
    print_error "MySQL connection failed. Please ensure:"
    print_error "1. XAMPP is running"
    print_error "2. MySQL service is started"
    print_error "3. judicial_dw database exists"
    print_status "You can create the database by running:"
    print_status "mysql -u root -e \"CREATE DATABASE IF NOT EXISTS judicial_dw;\""
    print_status "mysql -u root judicial_dw < judicial_dw.sql"
    exit 1
fi

print_success "MySQL connection verified"

# Step 1: Run ETL Pipeline
echo ""
print_status "Step 1: Running ETL Pipeline..."
echo "----------------------------------------"

python3 etl_pipeline.py

if [ $? -ne 0 ]; then
    print_error "ETL Pipeline failed!"
    print_error "Check the logs for detailed error information"
    exit 1
fi

print_success "ETL Pipeline completed successfully!"

# Step 2: Run Data Quality Checks
echo ""
print_status "Step 2: Running Data Quality Checks..."
echo "----------------------------------------------"

python3 data_quality_checker.py

if [ $? -ne 0 ]; then
    print_warning "Data quality checks failed, but continuing..."
else
    print_success "Data quality checks completed"
fi

# Step 3: Start the Dashboard
echo ""
print_status "Step 3: Starting Modern Dashboard..."
echo "-------------------------------------------"

# Check if dashboard directory exists
if [ ! -d "modern_dashboard" ]; then
    print_error "modern_dashboard directory not found!"
    exit 1
fi

# Navigate to dashboard directory
cd modern_dashboard

# Install dashboard dependencies
print_status "Installing dashboard dependencies..."
python3 -m pip install --break-system-packages flask flask-cors

if [ $? -ne 0 ]; then
    print_error "Failed to install dashboard dependencies"
    exit 1
fi

print_success "Dashboard dependencies installed"

# Start the dashboard
echo ""
print_success "🎉 Complete Pipeline Ready!"
echo "=================================="
print_success "✅ ETL Pipeline: Completed"
print_success "✅ Data Quality: Checked"
print_success "✅ Dashboard: Starting..."
echo ""
print_status "📊 Dashboard URL: http://localhost:8080"
print_status "🔗 API Base URL: http://localhost:8080/api/"
echo ""
print_status "💡 Press Ctrl+C to stop the dashboard"
echo ""

# Start the Flask server
python3 server.py 