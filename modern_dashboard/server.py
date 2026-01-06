#!/usr/bin/env python3
"""
Flask API Server for Judicial Service Dashboard
Provides REST API endpoints for dashboard data visualization
"""

from flask import Flask, jsonify, send_from_directory
from flask_cors import CORS
import mysql.connector
from mysql.connector import Error
import logging
from datetime import datetime, timedelta
import os

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

app = Flask(__name__, static_folder='.', static_url_path='')
CORS(app)

# Database configuration
DB_CONFIG = {
    'host': 'localhost',
    'user': 'root',
    'password': '',
    'database': 'judicial_dw'
}

def get_db_connection():
    """Create and return database connection"""
    try:
        conn = mysql.connector.connect(**DB_CONFIG)
        return conn
    except Error as e:
        logger.error(f"Error connecting to MySQL: {e}")
        return None

@app.route('/')
def index():
    """Serve the main dashboard HTML"""
    return send_from_directory('.', 'index.html')

@app.route('/api/metrics', methods=['GET'])
def get_metrics():
    """Get overview metrics"""
    try:
        conn = get_db_connection()
        if not conn:
            return jsonify({'error': 'Database connection failed'}), 500
        
        cursor = conn.cursor(dictionary=True)
        
        # Total cases
        cursor.execute("SELECT COUNT(*) as count FROM cases")
        total_cases = cursor.fetchone()['count']
        
        # Pending cases
        cursor.execute("SELECT COUNT(*) as count FROM cases WHERE Case_Status = 'Pending'")
        pending_cases = cursor.fetchone()['count']
        
        # Resolved cases
        cursor.execute("SELECT COUNT(*) as count FROM cases WHERE Case_Status IN ('Settled', 'Closed', 'Dismissed')")
        resolved_cases = cursor.fetchone()['count']
        
        # Resolution rate
        resolution_rate = (resolved_cases / total_cases * 100) if total_cases > 0 else 0
        
        # Average resolution time
        cursor.execute("SELECT AVG(Resolution_Time) as avg_time FROM cases WHERE Resolution_Time IS NOT NULL")
        avg_resolution_time = cursor.fetchone()['avg_time'] or 0
        
        # Total revenue
        cursor.execute("SELECT SUM(Amount) as total FROM cases WHERE Amount IS NOT NULL")
        total_revenue = cursor.fetchone()['total'] or 0
        
        # Active judges
        cursor.execute("SELECT COUNT(DISTINCT Judge_ID) as count FROM dim_judges")
        active_judges = cursor.fetchone()['count']
        
        cursor.close()
        conn.close()
        
        return jsonify({
            'totalCases': total_cases,
            'pendingCases': pending_cases,
            'resolvedCases': resolved_cases,
            'resolutionRate': round(resolution_rate, 1),
            'avgResolutionTime': round(avg_resolution_time, 0),
            'totalRevenue': round(total_revenue, 2),
            'activeJudges': active_judges
        })
    except Exception as e:
        logger.error(f"Error getting metrics: {e}")
        return jsonify({'error': str(e)}), 500

@app.route('/api/cases/status', methods=['GET'])
def get_case_status():
    """Get case status distribution"""
    try:
        conn = get_db_connection()
        if not conn:
            return jsonify({'error': 'Database connection failed'}), 500
        
        cursor = conn.cursor(dictionary=True)
        cursor.execute("""
            SELECT Case_Status, COUNT(*) as count 
            FROM cases 
            GROUP BY Case_Status
        """)
        
        results = cursor.fetchall()
        status_data = {row['Case_Status']: row['count'] for row in results}
        
        cursor.close()
        conn.close()
        
        return jsonify({
            'labels': list(status_data.keys()),
            'data': list(status_data.values())
        })
    except Exception as e:
        logger.error(f"Error getting case status: {e}")
        return jsonify({'error': str(e)}), 500

@app.route('/api/cases/types', methods=['GET'])
def get_case_types():
    """Get case types distribution"""
    try:
        conn = get_db_connection()
        if not conn:
            return jsonify({'error': 'Database connection failed'}), 500
        
        cursor = conn.cursor(dictionary=True)
        cursor.execute("""
            SELECT Case_Type, COUNT(*) as count 
            FROM cases 
            WHERE Case_Type IS NOT NULL
            GROUP BY Case_Type
            ORDER BY count DESC
            LIMIT 10
        """)
        
        results = cursor.fetchall()
        
        cursor.close()
        conn.close()
        
        return jsonify({
            'labels': [row['Case_Type'] for row in results],
            'data': [row['count'] for row in results]
        })
    except Exception as e:
        logger.error(f"Error getting case types: {e}")
        return jsonify({'error': str(e)}), 500

@app.route('/api/cases/outcomes', methods=['GET'])
def get_case_outcomes():
    """Get case outcomes by type"""
    try:
        conn = get_db_connection()
        if not conn:
            return jsonify({'error': 'Database connection failed'}), 500
        
        cursor = conn.cursor(dictionary=True)
        cursor.execute("""
            SELECT Case_Type, Outcome_Type, COUNT(*) as count 
            FROM cases 
            WHERE Case_Type IS NOT NULL AND Outcome_Type IS NOT NULL
            GROUP BY Case_Type, Outcome_Type
        """)
        
        results = cursor.fetchall()
        
        # Organize by case type
        outcome_data = {}
        for row in results:
            case_type = row['Case_Type']
            if case_type not in outcome_data:
                outcome_data[case_type] = {}
            outcome_data[case_type][row['Outcome_Type']] = row['count']
        
        cursor.close()
        conn.close()
        
        return jsonify(outcome_data)
    except Exception as e:
        logger.error(f"Error getting case outcomes: {e}")
        return jsonify({'error': str(e)}), 500

@app.route('/api/cases/payment', methods=['GET'])
def get_payment_status():
    """Get payment status distribution"""
    try:
        conn = get_db_connection()
        if not conn:
            return jsonify({'error': 'Database connection failed'}), 500
        
        cursor = conn.cursor(dictionary=True)
        cursor.execute("""
            SELECT Payment_Status, COUNT(*) as count 
            FROM cases 
            WHERE Payment_Status IS NOT NULL
            GROUP BY Payment_Status
        """)
        
        results = cursor.fetchall()
        
        cursor.close()
        conn.close()
        
        return jsonify({
            'labels': [row['Payment_Status'] for row in results],
            'data': [row['count'] for row in results]
        })
    except Exception as e:
        logger.error(f"Error getting payment status: {e}")
        return jsonify({'error': str(e)}), 500

@app.route('/api/cases/resolution-time', methods=['GET'])
def get_resolution_time():
    """Get resolution time distribution"""
    try:
        conn = get_db_connection()
        if not conn:
            return jsonify({'error': 'Database connection failed'}), 500
        
        cursor = conn.cursor(dictionary=True)
        cursor.execute("""
            SELECT 
                CASE 
                    WHEN Resolution_Time <= 30 THEN '0-30'
                    WHEN Resolution_Time <= 60 THEN '31-60'
                    WHEN Resolution_Time <= 90 THEN '61-90'
                    WHEN Resolution_Time <= 120 THEN '91-120'
                    WHEN Resolution_Time <= 150 THEN '121-150'
                    ELSE '150+'
                END as time_range,
                COUNT(*) as count
            FROM cases 
            WHERE Resolution_Time IS NOT NULL
            GROUP BY time_range
            ORDER BY MIN(Resolution_Time)
        """)
        
        results = cursor.fetchall()
        
        cursor.close()
        conn.close()
        
        return jsonify({
            'labels': [row['time_range'] for row in results],
            'data': [row['count'] for row in results]
        })
    except Exception as e:
        logger.error(f"Error getting resolution time: {e}")
        return jsonify({'error': str(e)}), 500

@app.route('/api/courts', methods=['GET'])
def get_courts():
    """Get cases per court"""
    try:
        conn = get_db_connection()
        if not conn:
            return jsonify({'error': 'Database connection failed'}), 500
        
        cursor = conn.cursor(dictionary=True)
        cursor.execute("""
            SELECT dc.Court_Name, COUNT(*) as count 
            FROM cases c
            JOIN dim_courts dc ON c.Court_Record_ID = dc.Court_ID
            GROUP BY dc.Court_Name
            ORDER BY count DESC
            LIMIT 10
        """)
        
        results = cursor.fetchall()
        
        cursor.close()
        conn.close()
        
        return jsonify({
            'labels': [row['Court_Name'] for row in results],
            'data': [row['count'] for row in results]
        })
    except Exception as e:
        logger.error(f"Error getting courts: {e}")
        return jsonify({'error': str(e)}), 500

@app.route('/api/courts/locations', methods=['GET'])
def get_court_locations():
    """Get court location distribution"""
    try:
        conn = get_db_connection()
        if not conn:
            return jsonify({'error': 'Database connection failed'}), 500
        
        cursor = conn.cursor(dictionary=True)
        cursor.execute("""
            SELECT dc.Court_Location, COUNT(*) as count 
            FROM cases c
            JOIN dim_courts dc ON c.Court_Record_ID = dc.Court_ID
            WHERE dc.Court_Location IS NOT NULL
            GROUP BY dc.Court_Location
            ORDER BY count DESC
        """)
        
        results = cursor.fetchall()
        
        cursor.close()
        conn.close()
        
        return jsonify({
            'labels': [row['Court_Location'] for row in results],
            'data': [row['count'] for row in results]
        })
    except Exception as e:
        logger.error(f"Error getting court locations: {e}")
        return jsonify({'error': str(e)}), 500

@app.route('/api/judges/experience', methods=['GET'])
def get_judge_experience():
    """Get judge experience distribution"""
    try:
        conn = get_db_connection()
        if not conn:
            return jsonify({'error': 'Database connection failed'}), 500
        
        cursor = conn.cursor(dictionary=True)
        cursor.execute("""
            SELECT 
                CASE 
                    WHEN Experience_Years <= 5 THEN '0-5'
                    WHEN Experience_Years <= 10 THEN '6-10'
                    WHEN Experience_Years <= 15 THEN '11-15'
                    WHEN Experience_Years <= 20 THEN '16-20'
                    ELSE '20+'
                END as experience_range,
                COUNT(*) as count
            FROM dim_judges 
            WHERE Experience_Years IS NOT NULL
            GROUP BY experience_range
            ORDER BY MIN(Experience_Years)
        """)
        
        results = cursor.fetchall()
        
        cursor.close()
        conn.close()
        
        return jsonify({
            'labels': [row['experience_range'] for row in results],
            'data': [row['count'] for row in results]
        })
    except Exception as e:
        logger.error(f"Error getting judge experience: {e}")
        return jsonify({'error': str(e)}), 500

@app.route('/api/judges/courts', methods=['GET'])
def get_judges_per_court():
    """Get judges per court"""
    try:
        conn = get_db_connection()
        if not conn:
            return jsonify({'error': 'Database connection failed'}), 500
        
        cursor = conn.cursor(dictionary=True)
        cursor.execute("""
            SELECT dj.Assigned_Court, COUNT(*) as count 
            FROM dim_judges dj
            WHERE dj.Assigned_Court IS NOT NULL
            GROUP BY dj.Assigned_Court
            ORDER BY count DESC
            LIMIT 10
        """)
        
        results = cursor.fetchall()
        
        cursor.close()
        conn.close()
        
        return jsonify({
            'labels': [row['Assigned_Court'] for row in results],
            'data': [row['count'] for row in results]
        })
    except Exception as e:
        logger.error(f"Error getting judges per court: {e}")
        return jsonify({'error': str(e)}), 500

@app.route('/api/trends', methods=['GET'])
def get_trends():
    """Get case filing trends"""
    try:
        conn = get_db_connection()
        if not conn:
            return jsonify({'error': 'Database connection failed'}), 500
        
        cursor = conn.cursor(dictionary=True)
        
        # Get monthly filing trends
        cursor.execute("""
            SELECT 
                DATE_FORMAT(Filing_Date, '%Y-%m') as month,
                COUNT(*) as filings,
                SUM(CASE WHEN Resolution_Date IS NOT NULL THEN 1 ELSE 0 END) as resolutions
            FROM cases 
            WHERE Filing_Date IS NOT NULL
            GROUP BY month
            ORDER BY month DESC
            LIMIT 12
        """)
        
        results = cursor.fetchall()
        
        cursor.close()
        conn.close()
        
        # Format for chart
        months = [row['month'] for row in reversed(results)]
        filings = [row['filings'] for row in reversed(results)]
        resolutions = [row['resolutions'] for row in reversed(results)]
        
        return jsonify({
            'labels': months,
            'filings': filings,
            'resolutions': resolutions
        })
    except Exception as e:
        logger.error(f"Error getting trends: {e}")
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    print("🚀 Starting Judicial Service Dashboard Server...")
    print("📊 Dashboard URL: http://localhost:8080")
    print("🔗 API Base URL: http://localhost:8080/api/")
    print("💡 Press Ctrl+C to stop the server")
    print("")
    
    app.run(host='0.0.0.0', port=8080, debug=True)
