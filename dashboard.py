import streamlit as st
import pandas as pd
import json
import mysql.connector
import matplotlib.pyplot as plt

# Function to load the ETL metrics from the JSON file
def load_etl_metrics(metrics_file="etl_metrics.json"):
    try:
        with open(metrics_file, 'r') as f:
            metrics = json.load(f)
        return metrics
    except FileNotFoundError:
        return {}

# Function to connect to MySQL
def connect_to_database():
    connection = mysql.connector.connect(
        host="localhost",
        user="root", 
        password="",  
        database="judicial_dw"  
    )
    return connection

# Function to fetch data from a table
def fetch_data(query):
    connection = connect_to_database()
    df = pd.read_sql(query, connection)
    connection.close()
    return df

# Sidebar for navigation and filtering
st.sidebar.title("Judicial Service Dashboard")
page = st.sidebar.radio("Select a Page", ["ETL Metrics", "Case Data Analysis", "Judge and Court Insights"])

# Page 1: Display ETL Process Metrics
if page == "ETL Metrics":
    st.title('ETL Process Metrics')

    metrics = load_etl_metrics()

    if metrics:
        # Create a list to store the ETL metrics for the table
        metrics_data = []

        for table_name, metric in metrics.items():
            metrics_data.append({
                "Table Name": table_name,
                "Timestamp": metric['timestamp'],
                "Records Inserted": metric['records_inserted']
            })

        # Convert the list of metrics data into a DataFrame
        metrics_df = pd.DataFrame(metrics_data)

        # Display the metrics data in a table format
        st.subheader("ETL Process Metrics Table")
        st.table(metrics_df)  # or use st.dataframe() for better interactivity

    else:
        st.write("No ETL metrics found. Please run the ETL process first.")

# Page 2: Case Data Analysis
elif page == "Case Data Analysis":
    st.title('Case Data Analysis')

    # Query case outcomes distribution
    query_outcome = """
        SELECT Outcome_Type, COUNT(Case_ID) as Number_of_Cases
        FROM cases
        GROUP BY Outcome_Type
    """
    outcome_df = fetch_data(query_outcome)

    if outcome_df.empty:
        st.write("No data found for Case Outcomes Distribution.")
    else:
        # Bar chart for case outcomes
        st.subheader("Case Outcomes Distribution")
        st.bar_chart(outcome_df.set_index('Outcome_Type')['Number_of_Cases'])

    # Query Payment Status distribution
    query_payment_status = """
        SELECT Payment_Status, COUNT(Case_ID) as Number_of_Cases
        FROM cases
        GROUP BY Payment_Status
    """
    payment_status_df = fetch_data(query_payment_status)

    if payment_status_df.empty:
        st.write("No data found for Payment Status Distribution.")
    else:
        # Pie chart for Payment Status
        st.subheader("Payment Status Distribution")
        fig, ax = plt.subplots()
        ax.pie(payment_status_df['Number_of_Cases'], labels=payment_status_df['Payment_Status'], autopct='%1.1f%%', startangle=90)
        ax.axis('equal')  # Equal aspect ratio ensures that pie is drawn as a circle.
        st.pyplot(fig)

    # Query case status distribution
    query_case_status = """
        SELECT Case_Status, COUNT(Case_ID) as Number_of_Cases
        FROM cases
        GROUP BY Case_Status
    """
    case_status_df = fetch_data(query_case_status)

    if case_status_df.empty:
        st.write("No data found for Case Status Distribution.")
    else:
        # Horizontal bar chart for case status
        st.subheader("Case Status Distribution")
        st.bar_chart(case_status_df.set_index('Case_Status')['Number_of_Cases'])

# Page 3: Judge and Court Insights
elif page == "Judge and Court Insights":
    st.title('Judge and Court Insights')

    # Query Judges data
    query_judges = "SELECT * FROM dim_judges"
    judges_df = fetch_data(query_judges)

    # Display judge statistics
    st.subheader("Judges Data Overview")
    st.write(judges_df)  # Show the table of judges data

    # Display Judge's Experience Distribution (Histogram)
    st.subheader("Judge's Experience Distribution")
    fig, ax = plt.subplots()
    ax.hist(judges_df['Experience_Years'], bins=20, color='skyblue', edgecolor='black')
    ax.set_title("Experience Years Distribution of Judges")
    ax.set_xlabel("Experience Years")
    ax.set_ylabel("Number of Judges")
    st.pyplot(fig)

    # Query Courts data
    query_courts = "SELECT * FROM dim_courts"
    courts_df = fetch_data(query_courts)

    # Display court statistics
    st.subheader("Courts Data Overview")
    st.write(courts_df)  # Show the table of court data

    # Query the number of cases per court with JOIN
    query_cases_per_court = """
        SELECT c.Court_Name, COUNT(cas.Case_ID) as Number_of_Cases
        FROM cases cas
        JOIN dim_courts c ON cas.Court_Record_ID = c.Court_ID  # Using Court_Record_ID to join with Court_ID
        GROUP BY c.Court_Name
    """
    cases_per_court_df = fetch_data(query_cases_per_court)

    if cases_per_court_df.empty:
        st.write("No data found for Number of Cases per Court.")
    else:
        st.subheader("Number of Cases per Court")
        st.bar_chart(cases_per_court_df.set_index('Court_Name')['Number_of_Cases'])

    # Court Location Distribution (Pie chart)
    st.subheader("Court Location Distribution")
    query_court_location = """
        SELECT Court_Location, COUNT(Court_ID) as Number_of_Courts
        FROM dim_courts
        GROUP BY Court_Location
    """
    court_location_df = fetch_data(query_court_location)

    fig, ax = plt.subplots()
    ax.pie(court_location_df['Number_of_Courts'], labels=court_location_df['Court_Location'], autopct='%1.1f%%', startangle=90)
    ax.axis('equal')  # Equal aspect ratio ensures that pie is drawn as a circle.
    st.pyplot(fig)

    # Judge Distribution per Court (Pie chart)
    st.subheader("Judge Distribution per Court")
    query_judge_per_court = """
        SELECT Assigned_Court, COUNT(Judge_ID) as Number_of_Judges
        FROM dim_judges
        GROUP BY Assigned_Court
    """
    judge_per_court_df = fetch_data(query_judge_per_court)

    fig, ax = plt.subplots()
    ax.pie(judge_per_court_df['Number_of_Judges'], labels=judge_per_court_df['Assigned_Court'], autopct='%1.1f%%', startangle=90)
    ax.axis('equal')
    st.pyplot(fig)
