# 🎨 Modern Judicial Dashboard

A beautiful, modern web-based dashboard for the Judicial Service of Ghana with interactive charts, real-time data, and a sleek design.

## ✨ Features

- **🎨 Modern Design**: Clean, professional interface with gradients and animations
- **📊 Interactive Charts**: Beautiful visualizations using Chart.js
- **🌙 Dark/Light Theme**: Toggle between themes
- **📱 Responsive**: Works on desktop, tablet, and mobile
- **⚡ Real-time Data**: Live data from your MySQL database
- **🔄 Auto-refresh**: Charts update automatically
- **🎯 Multiple Views**: Overview, Cases, Courts, Judges, and Trends

## 🚀 Quick Start

### Prerequisites

- Python 3.9+
- XAMPP (MySQL running)
- Judicial database set up

### Installation & Running

1. **Navigate to the dashboard directory:**
   ```bash
   cd modern_dashboard
   ```

2. **Run the startup script:**
   ```bash
   ./start_dashboard.sh
   ```

3. **Open your browser:**
   ```
   http://localhost:8080
   ```

## 📁 Project Structure

```
modern_dashboard/
├── index.html          # Main dashboard page
├── styles.css          # Modern CSS styles
├── script.js           # Dashboard functionality
├── server.py           # Flask backend server
├── requirements.txt    # Python dependencies
├── start_dashboard.sh  # Startup script
└── README.md          # This file
```

## 🎯 Dashboard Sections

### 📊 Overview
- Key Performance Indicators
- Case Status Distribution
- Case Types Overview
- Real-time metrics

### 📁 Case Analysis
- Case Outcomes by Type
- Payment Status Distribution
- Resolution Time Analysis
- Detailed case insights

### 🏛️ Court Performance
- Cases per Court
- Court Location Distribution
- Performance metrics

### 👨‍⚖️ Judge Performance
- Judge Experience Distribution
- Judges per Court
- Individual performance data

### 📈 Trends & Analytics
- Case Filing Trends
- Historical data analysis
- Predictive insights

## 🔧 API Endpoints

The dashboard connects to these API endpoints:

- `GET /api/metrics` - Dashboard metrics
- `GET /api/charts/status` - Case status distribution
- `GET /api/charts/types` - Case types distribution
- `GET /api/charts/outcomes` - Case outcomes by type
- `GET /api/charts/payment` - Payment status
- `GET /api/charts/resolution-time` - Resolution time distribution
- `GET /api/charts/courts` - Cases per court
- `GET /api/charts/locations` - Court locations
- `GET /api/charts/experience` - Judge experience
- `GET /api/charts/judge-courts` - Judges per court
- `GET /api/charts/trends` - Filing trends

## 🎨 Design Features

- **Modern UI**: Clean, professional design
- **Gradient Backgrounds**: Beautiful color schemes
- **Smooth Animations**: Hover effects and transitions
- **Interactive Elements**: Clickable charts and navigation
- **Responsive Layout**: Works on all screen sizes
- **Custom Scrollbars**: Styled scrollbars
- **Loading States**: Smooth loading animations

## 🔄 Data Updates

The dashboard automatically:
- Fetches real-time data from your MySQL database
- Updates charts and metrics
- Refreshes data when switching sections
- Handles connection errors gracefully

## 🛠️ Customization

### Colors
Edit `styles.css` to customize:
- Primary colors
- Gradients
- Theme colors
- Chart colors

### Charts
Modify `script.js` to:
- Add new chart types
- Change chart configurations
- Add new data sources

### Backend
Update `server.py` to:
- Add new API endpoints
- Modify database queries
- Add data processing logic

## 🐛 Troubleshooting

### Dashboard won't load
- Check if Flask server is running
- Verify port 8080 is available
- Check browser console for errors

### No data showing
- Ensure XAMPP MySQL is running
- Verify database connection
- Check API endpoints are responding

### Charts not displaying
- Check Chart.js is loaded
- Verify data format from API
- Check browser console for errors

## 📱 Mobile Support

The dashboard is fully responsive and works on:
- Desktop computers
- Tablets
- Mobile phones
- All modern browsers

## 🔒 Security

- CORS enabled for local development
- Database connection uses local credentials
- No sensitive data exposed in frontend

## 🚀 Performance

- Optimized chart rendering
- Efficient data fetching
- Minimal server load
- Fast page loading

## 📞 Support

For issues or questions:
1. Check the troubleshooting section
2. Verify all prerequisites are met
3. Check browser console for errors
4. Ensure database is properly set up

---

**Enjoy your modern judicial dashboard! 🎉** 