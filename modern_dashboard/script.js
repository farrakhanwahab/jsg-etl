// Dashboard JavaScript
class JudicialDashboard {
    constructor() {
        this.charts = {};
        this.currentSection = 'overview';
        this.theme = 'light';
        this.init();
    }

    init() {
        this.setupEventListeners();
        this.loadDashboardData();
        this.createCharts();
    }

    setupEventListeners() {
        // Navigation
        document.querySelectorAll('.nav-item').forEach(item => {
            item.addEventListener('click', (e) => {
                this.switchSection(e.currentTarget.dataset.section);
            });
        });

        // Theme toggle
        document.getElementById('themeToggle').addEventListener('click', () => {
            this.toggleTheme();
        });
    }

    switchSection(section) {
        // Update navigation
        document.querySelectorAll('.nav-item').forEach(item => {
            item.classList.remove('active');
        });
        document.querySelector(`[data-section="${section}"]`).classList.add('active');

        // Update sections
        document.querySelectorAll('.dashboard-section').forEach(sectionEl => {
            sectionEl.classList.remove('active');
        });
        document.getElementById(section).classList.add('active');

        // Update page title
        const titles = {
            overview: 'Dashboard Overview',
            cases: 'Case Analysis',
            courts: 'Court Performance',
            judges: 'Judge Performance',
            trends: 'Trends & Analytics'
        };
        document.getElementById('pageTitle').textContent = titles[section];

        this.currentSection = section;
        this.loadSectionData(section);
    }

    toggleTheme() {
        this.theme = this.theme === 'light' ? 'dark' : 'light';
        document.documentElement.setAttribute('data-theme', this.theme);
        
        const icon = document.querySelector('#themeToggle i');
        icon.className = this.theme === 'light' ? 'fas fa-moon' : 'fas fa-sun';

        // Update charts for new theme
        this.updateChartsTheme();
    }

    async loadDashboardData() {
        try {
            // Load overview metrics
            const metrics = await this.fetchMetrics();
            this.updateMetrics(metrics);

            // Load chart data
            await this.loadChartData();
        } catch (error) {
            console.error('Error loading dashboard data:', error);
            this.showError('Failed to load dashboard data');
        }
    }

    async fetchMetrics() {
        // Simulated data - replace with actual API calls
        return {
            totalCases: 1250,
            pendingCases: 342,
            resolvedCases: 908,
            resolutionRate: 72.6,
            avgResolutionTime: 45,
            totalRevenue: 1250000,
            activeJudges: 28
        };
    }

    updateMetrics(metrics) {
        document.getElementById('totalCases').textContent = metrics.totalCases.toLocaleString();
        document.getElementById('pendingCases').textContent = metrics.pendingCases.toLocaleString();
        document.getElementById('resolvedCases').textContent = metrics.resolvedCases.toLocaleString();
        document.getElementById('resolutionRate').textContent = `${metrics.resolutionRate}%`;
        document.getElementById('avgResolutionTime').textContent = `${metrics.avgResolutionTime} days`;
        document.getElementById('totalRevenue').textContent = `$${(metrics.totalRevenue / 1000000).toFixed(1)}M`;
        document.getElementById('activeJudges').textContent = metrics.activeJudges;
    }

    async loadChartData() {
        // Load data for all charts
        await Promise.all([
            this.loadStatusChart(),
            this.loadTypeChart(),
            this.loadOutcomeChart(),
            this.loadPaymentChart(),
            this.loadResolutionTimeChart(),
            this.loadCourtChart(),
            this.loadLocationChart(),
            this.loadExperienceChart(),
            this.loadJudgeCourtChart(),
            this.loadTrendsChart()
        ]);
    }

    async loadSectionData(section) {
        // Load specific section data when switching
        switch(section) {
            case 'cases':
                await this.loadCaseAnalysisData();
                break;
            case 'courts':
                await this.loadCourtData();
                break;
            case 'judges':
                await this.loadJudgeData();
                break;
            case 'trends':
                await this.loadTrendsData();
                break;
        }
    }

    // Chart creation methods
    createCharts() {
        this.createStatusChart();
        this.createTypeChart();
        this.createOutcomeChart();
        this.createPaymentChart();
        this.createResolutionTimeChart();
        this.createCourtChart();
        this.createLocationChart();
        this.createExperienceChart();
        this.createJudgeCourtChart();
        this.createTrendsChart();
    }

    createStatusChart() {
        const ctx = document.getElementById('statusChart');
        if (!ctx) return;

        this.charts.statusChart = new Chart(ctx, {
            type: 'doughnut',
            data: {
                labels: ['Pending', 'Settled', 'Closed', 'Dismissed'],
                datasets: [{
                    data: [342, 456, 234, 218],
                    backgroundColor: [
                        '#f59e0b',
                        '#10b981',
                        '#6366f1',
                        '#ef4444'
                    ],
                    borderWidth: 0
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        position: 'bottom',
                        labels: {
                            usePointStyle: true,
                            padding: 20,
                            color: getComputedStyle(document.documentElement).getPropertyValue('--text-primary')
                        }
                    }
                }
            }
        });
    }

    createTypeChart() {
        const ctx = document.getElementById('typeChart');
        if (!ctx) return;

        this.charts.typeChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Civil', 'Criminal', 'Commercial', 'Family', 'Labour'],
                datasets: [{
                    label: 'Number of Cases',
                    data: [289, 234, 198, 167, 156],
                    backgroundColor: '#6366f1',
                    borderRadius: 8,
                    borderSkipped: false
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: false
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        grid: {
                            color: getComputedStyle(document.documentElement).getPropertyValue('--border-color')
                        },
                        ticks: {
                            color: getComputedStyle(document.documentElement).getPropertyValue('--text-secondary')
                        }
                    },
                    x: {
                        grid: {
                            display: false
                        },
                        ticks: {
                            color: getComputedStyle(document.documentElement).getPropertyValue('--text-secondary')
                        }
                    }
                }
            }
        });
    }

    createOutcomeChart() {
        const ctx = document.getElementById('outcomeChart');
        if (!ctx) return;

        this.charts.outcomeChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Settled', 'Dismissed', 'Acquittal', 'Conviction'],
                datasets: [{
                    label: 'Civil',
                    data: [89, 67, 45, 23],
                    backgroundColor: '#6366f1'
                }, {
                    label: 'Criminal',
                    data: [67, 34, 78, 55],
                    backgroundColor: '#ef4444'
                }, {
                    label: 'Commercial',
                    data: [78, 45, 23, 52],
                    backgroundColor: '#10b981'
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        position: 'top',
                        labels: {
                            color: getComputedStyle(document.documentElement).getPropertyValue('--text-primary')
                        }
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        grid: {
                            color: getComputedStyle(document.documentElement).getPropertyValue('--border-color')
                        },
                        ticks: {
                            color: getComputedStyle(document.documentElement).getPropertyValue('--text-secondary')
                        }
                    },
                    x: {
                        grid: {
                            display: false
                        },
                        ticks: {
                            color: getComputedStyle(document.documentElement).getPropertyValue('--text-secondary')
                        }
                    }
                }
            }
        });
    }

    createPaymentChart() {
        const ctx = document.getElementById('paymentChart');
        if (!ctx) return;

        this.charts.paymentChart = new Chart(ctx, {
            type: 'pie',
            data: {
                labels: ['Paid', 'Pending', 'Failed'],
                datasets: [{
                    data: [567, 342, 341],
                    backgroundColor: [
                        '#10b981',
                        '#f59e0b',
                        '#ef4444'
                    ],
                    borderWidth: 0
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        position: 'bottom',
                        labels: {
                            usePointStyle: true,
                            padding: 20,
                            color: getComputedStyle(document.documentElement).getPropertyValue('--text-primary')
                        }
                    }
                }
            }
        });
    }

    createResolutionTimeChart() {
        const ctx = document.getElementById('resolutionTimeChart');
        if (!ctx) return;

        this.charts.resolutionTimeChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['0-30', '31-60', '61-90', '91-120', '121-150', '150+'],
                datasets: [{
                    label: 'Number of Cases',
                    data: [234, 345, 289, 156, 89, 67],
                    borderColor: '#6366f1',
                    backgroundColor: 'rgba(99, 102, 241, 0.1)',
                    fill: true,
                    tension: 0.4
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: false
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        grid: {
                            color: getComputedStyle(document.documentElement).getPropertyValue('--border-color')
                        },
                        ticks: {
                            color: getComputedStyle(document.documentElement).getPropertyValue('--text-secondary')
                        }
                    },
                    x: {
                        grid: {
                            display: false
                        },
                        ticks: {
                            color: getComputedStyle(document.documentElement).getPropertyValue('--text-secondary')
                        }
                    }
                }
            }
        });
    }

    createCourtChart() {
        const ctx = document.getElementById('courtChart');
        if (!ctx) return;

        this.charts.courtChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['High Court', 'District Court', 'Circuit Court', 'Magistrate Court'],
                datasets: [{
                    label: 'Cases',
                    data: [234, 189, 156, 123],
                    backgroundColor: '#6366f1',
                    borderRadius: 8
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: false
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        grid: {
                            color: getComputedStyle(document.documentElement).getPropertyValue('--border-color')
                        },
                        ticks: {
                            color: getComputedStyle(document.documentElement).getPropertyValue('--text-secondary')
                        }
                    },
                    x: {
                        grid: {
                            display: false
                        },
                        ticks: {
                            color: getComputedStyle(document.documentElement).getPropertyValue('--text-secondary')
                        }
                    }
                }
            }
        });
    }

    createLocationChart() {
        const ctx = document.getElementById('locationChart');
        if (!ctx) return;

        this.charts.locationChart = new Chart(ctx, {
            type: 'doughnut',
            data: {
                labels: ['Accra', 'Kumasi', 'Tamale', 'Cape Coast', 'Others'],
                datasets: [{
                    data: [345, 234, 189, 156, 123],
                    backgroundColor: [
                        '#6366f1',
                        '#10b981',
                        '#f59e0b',
                        '#ef4444',
                        '#8b5cf6'
                    ],
                    borderWidth: 0
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        position: 'bottom',
                        labels: {
                            usePointStyle: true,
                            padding: 20,
                            color: getComputedStyle(document.documentElement).getPropertyValue('--text-primary')
                        }
                    }
                }
            }
        });
    }

    createExperienceChart() {
        const ctx = document.getElementById('experienceChart');
        if (!ctx) return;

        this.charts.experienceChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['0-5', '6-10', '11-15', '16-20', '20+'],
                datasets: [{
                    label: 'Judges',
                    data: [5, 8, 7, 4, 4],
                    backgroundColor: '#6366f1',
                    borderRadius: 8
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: false
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        grid: {
                            color: getComputedStyle(document.documentElement).getPropertyValue('--border-color')
                        },
                        ticks: {
                            color: getComputedStyle(document.documentElement).getPropertyValue('--text-secondary')
                        }
                    },
                    x: {
                        grid: {
                            display: false
                        },
                        ticks: {
                            color: getComputedStyle(document.documentElement).getPropertyValue('--text-secondary')
                        }
                    }
                }
            }
        });
    }

    createJudgeCourtChart() {
        const ctx = document.getElementById('judgeCourtChart');
        if (!ctx) return;

        this.charts.judgeCourtChart = new Chart(ctx, {
            type: 'doughnut',
            data: {
                labels: ['High Court', 'District Court', 'Circuit Court', 'Magistrate Court'],
                datasets: [{
                    data: [8, 6, 5, 4],
                    backgroundColor: [
                        '#6366f1',
                        '#10b981',
                        '#f59e0b',
                        '#ef4444'
                    ],
                    borderWidth: 0
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        position: 'bottom',
                        labels: {
                            usePointStyle: true,
                            padding: 20,
                            color: getComputedStyle(document.documentElement).getPropertyValue('--text-primary')
                        }
                    }
                }
            }
        });
    }

    createTrendsChart() {
        const ctx = document.getElementById('trendsChart');
        if (!ctx) return;

        this.charts.trendsChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                datasets: [{
                    label: 'Case Filings',
                    data: [89, 76, 98, 87, 95, 102, 88, 94, 101, 97, 105, 112],
                    borderColor: '#6366f1',
                    backgroundColor: 'rgba(99, 102, 241, 0.1)',
                    fill: true,
                    tension: 0.4
                }, {
                    label: 'Resolutions',
                    data: [67, 58, 72, 65, 78, 85, 71, 76, 82, 79, 87, 94],
                    borderColor: '#10b981',
                    backgroundColor: 'rgba(16, 185, 129, 0.1)',
                    fill: true,
                    tension: 0.4
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        position: 'top',
                        labels: {
                            color: getComputedStyle(document.documentElement).getPropertyValue('--text-primary')
                        }
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        grid: {
                            color: getComputedStyle(document.documentElement).getPropertyValue('--border-color')
                        },
                        ticks: {
                            color: getComputedStyle(document.documentElement).getPropertyValue('--text-secondary')
                        }
                    },
                    x: {
                        grid: {
                            display: false
                        },
                        ticks: {
                            color: getComputedStyle(document.documentElement).getPropertyValue('--text-secondary')
                        }
                    }
                }
            }
        });
    }

    updateChartsTheme() {
        // Update chart colors for new theme
        Object.values(this.charts).forEach(chart => {
            if (chart && chart.options) {
                const textColor = getComputedStyle(document.documentElement).getPropertyValue('--text-primary');
                const gridColor = getComputedStyle(document.documentElement).getPropertyValue('--border-color');
                
                if (chart.options.scales) {
                    if (chart.options.scales.y) {
                        chart.options.scales.y.grid.color = gridColor;
                        chart.options.scales.y.ticks.color = textColor;
                    }
                    if (chart.options.scales.x) {
                        chart.options.scales.x.ticks.color = textColor;
                    }
                }
                
                if (chart.options.plugins && chart.options.plugins.legend) {
                    chart.options.plugins.legend.labels.color = textColor;
                }
                
                chart.update();
            }
        });
    }

    showError(message) {
        // Create error notification
        const notification = document.createElement('div');
        notification.className = 'error-notification';
        notification.textContent = message;
        notification.style.cssText = `
            position: fixed;
            top: 20px;
            right: 20px;
            background: #ef4444;
            color: white;
            padding: 1rem 1.5rem;
            border-radius: 0.5rem;
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
            z-index: 10000;
            animation: slideIn 0.3s ease;
        `;
        
        document.body.appendChild(notification);
        
        setTimeout(() => {
            notification.remove();
        }, 5000);
    }

    // Data loading methods (to be implemented with actual API calls)
    async loadStatusChart() {
        // Simulate API call
        await new Promise(resolve => setTimeout(resolve, 100));
    }

    async loadTypeChart() {
        await new Promise(resolve => setTimeout(resolve, 100));
    }

    async loadOutcomeChart() {
        await new Promise(resolve => setTimeout(resolve, 100));
    }

    async loadPaymentChart() {
        await new Promise(resolve => setTimeout(resolve, 100));
    }

    async loadResolutionTimeChart() {
        await new Promise(resolve => setTimeout(resolve, 100));
    }

    async loadCourtChart() {
        await new Promise(resolve => setTimeout(resolve, 100));
    }

    async loadLocationChart() {
        await new Promise(resolve => setTimeout(resolve, 100));
    }

    async loadExperienceChart() {
        await new Promise(resolve => setTimeout(resolve, 100));
    }

    async loadJudgeCourtChart() {
        await new Promise(resolve => setTimeout(resolve, 100));
    }

    async loadTrendsChart() {
        await new Promise(resolve => setTimeout(resolve, 100));
    }

    async loadCaseAnalysisData() {
        await new Promise(resolve => setTimeout(resolve, 100));
    }

    async loadCourtData() {
        await new Promise(resolve => setTimeout(resolve, 100));
    }

    async loadJudgeData() {
        await new Promise(resolve => setTimeout(resolve, 100));
    }

    async loadTrendsData() {
        await new Promise(resolve => setTimeout(resolve, 100));
    }
}

// Global functions
function refreshChart(chartId) {
    if (dashboard.charts[chartId]) {
        dashboard.charts[chartId].update();
    }
}

// Initialize dashboard when DOM is loaded
let dashboard;
document.addEventListener('DOMContentLoaded', () => {
    dashboard = new JudicialDashboard();
});

// Add CSS for error notification
const style = document.createElement('style');
style.textContent = `
    @keyframes slideIn {
        from { transform: translateX(100%); opacity: 0; }
        to { transform: translateX(0); opacity: 1; }
    }
`;
document.head.appendChild(style); 