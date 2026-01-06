#!/bin/bash

# Modern Judicial Dashboard Startup Script

echo "🚀 Starting Modern Judicial Dashboard..."

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 is not installed. Please install Python 3.9 or later."
    exit 1
fi

# Check if we're in the right directory
if [ ! -f "server.py" ]; then
    echo "❌ Please run this script from the modern_dashboard directory."
    exit 1
fi

# Install dependencies if needed
echo "📦 Checking dependencies..."
if [ ! -d "venv" ]; then
    echo "🔧 Creating virtual environment..."
    python3 -m venv venv
fi

# Activate virtual environment
source venv/bin/activate

# Install requirements
echo "📦 Installing dependencies..."
pip install -r requirements.txt

# Check if MySQL is running (XAMPP)
echo "🔍 Checking MySQL connection..."
python -c "
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
    print('💡 Make sure XAMPP MySQL is running')
    exit(1)
"

if [ $? -ne 0 ]; then
    echo "❌ Please start XAMPP MySQL service and try again."
    exit 1
fi

echo ""
echo "🎉 Modern Dashboard is starting..."
echo "📊 Dashboard URL: http://localhost:8080"
echo "🔗 API Base URL: http://localhost:8080/api/"
echo ""
echo "💡 Press Ctrl+C to stop the server"
echo ""

# Start the Flask server
python server.py 