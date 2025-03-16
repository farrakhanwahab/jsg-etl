import os
import time
import mysql.connector
import pandas as pd
from tqdm import tqdm

# Database connection details
DB_HOST = 'localhost'
DB_USER = 'root'  
DB_PASSWORD = ''  
DB_NAME = 'judicial_dw'  

# Directories to scan for data files
data_directories = ['generated_data', 'Data', 'mock_data', 'Data_Point']

# Function to create a MySQL database connection
def connect_to_database():
    connection = mysql.connector.connect(
        host=DB_HOST,
        user=DB_USER,
        password=DB_PASSWORD,
        database=DB_NAME
    )
    return connection

# Function to delete all records from the table
def delete_existing_records(connection, cursor, table_name):
    print(f"Deleting existing records from {table_name}...")
    cursor.execute(f"DELETE FROM {table_name}")
    connection.commit() 

# Function to extract data from multiple directories (CSV, Excel, TXT files)
def extract_data_from_multiple_directories(directories):
    data = {}

    for directory in directories:
        if os.path.exists(directory):  # Ensure directory exists
            files = os.listdir(directory)

            for file in files:
                file_path = os.path.join(directory, file)

                if file.endswith(".csv"):
                    print(f"Reading CSV file: {file_path}")
                    data[file] = pd.read_csv(file_path)
                elif file.endswith(".xlsx"):
                    print(f"Reading Excel file: {file_path}")
                    data[file] = pd.read_excel(file_path, sheet_name=None)  
                elif file.endswith(".txt"):
                    print(f"Reading TXT file: {file_path}")
                    data[file] = pd.read_csv(file_path, sep="\t")
                else:
                    print(f"Unsupported file format: {file}")
        else:
            print(f"Directory {directory} does not exist or is not accessible.")
    
    return data

# Function to load data into the MySQL database
def load_data(connection, data):
    print("[Loading...]")
    time.sleep(3)

    cursor = connection.cursor()

    # Delete existing data from all tables to avoid duplicates
    delete_existing_records(connection, cursor, "dim_case_type")
    delete_existing_records(connection, cursor, "dim_courts")
    delete_existing_records(connection, cursor, "dim_judges")
    delete_existing_records(connection, cursor, "dim_outcome_types")
    delete_existing_records(connection, cursor, "dim_parties_involved")
    delete_existing_records(connection, cursor, "dim_payment_status")
    delete_existing_records(connection, cursor, "cases")

    # Insert data into dimension tables
    for key, df in data.items():
        print(f"Loading data from {key}...")

        # Handle CSV files
        if key.endswith(".csv"):
            table_name = key.split('.')[0]
            for index, row in df.iterrows():
                if table_name == 'dim_case_type':
                    cursor.execute("""
                        INSERT IGNORE INTO dim_case_type (Case_Type_ID, Case_Type_Name)
                        VALUES (%s, %s)
                    """, (row['Case_Type_ID'], row['Case_Type_Name']))
                elif table_name == 'dim_courts':
                    cursor.execute("""
                        INSERT IGNORE INTO dim_courts (Court_ID, Court_Name, Court_Location)
                        VALUES (%s, %s, %s)
                    """, (row['Court_ID'], row['Court_Name'], row['Court_Location']))
                elif table_name == 'dim_judges':
                    cursor.execute("""
                        INSERT IGNORE INTO dim_judges (Judge_ID, Judge_Name, Experience_Years, Specialization, Assigned_Court)
                        VALUES (%s, %s, %s, %s, %s)
                    """, (row['Judge_ID'], row['Judge_Name'], row['Experience_Years'], row['Specialization'], row['Assigned_Court']))
                elif table_name == 'dim_outcome_types':
                    cursor.execute("""
                        INSERT IGNORE INTO dim_outcome_types (Outcome_Type_ID, Outcome_Name, Description, Outcome_Type_Name)
                        VALUES (%s, %s, %s, %s)
                    """, (row['Outcome_Type_ID'], row['Outcome_Name'], row['Description'], row['Outcome_Type_Name']))
                elif table_name == 'dim_parties_involved':
                    cursor.execute("""
                        INSERT IGNORE INTO dim_parties_involved (Party_ID, Party_Type, Gender, Age, Legal_Representation)
                        VALUES (%s, %s, %s, %s, %s)
                    """, (row['Party_ID'], row['Party_Type'], row['Gender'], row['Age'], row['Legal_Representation']))
                elif table_name == 'dim_payment_status':  
                    cursor.execute("""
                        INSERT IGNORE INTO dim_payment_status (Payment_Status_ID, Payment_Status_Name)
                        VALUES (%s, %s)
                    """, (row['Payment_Status_ID'], row['Payment_Status_Name']))
                elif table_name == 'cases':
                    cursor.execute("""
                        INSERT IGNORE INTO cases (Case_ID, Case_Type, Case_Status, Filing_Date, Resolution_Date,
                                                   Cost_Type, Amount, Payment_Status, Outcome_Type, Resolution_Time,
                                                   Judge_ID, Court_Record_ID)
                        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
                    """, (row['Case_ID'], row['Case_Type'], row['Case_Status'], row['Filing_Date'],
                          row['Resolution_Date'], row['Cost_Type'], row['Amount'], row['Payment_Status'],
                          row['Outcome_Type'], row['Resolution_Time'], row['Judge_ID'], row['Court_Record_ID']))

        # Handle Excel files (all sheets will be loaded into corresponding tables)
        elif key.endswith(".xlsx"):
            for sheet_name, sheet_df in df.items():
                for index, row in sheet_df.iterrows():
                    if sheet_name == 'dim_case_type':
                        cursor.execute("""
                            INSERT IGNORE INTO dim_case_type (Case_Type_ID, Case_Type_Name)
                            VALUES (%s, %s)
                        """, (row['Case_Type_ID'], row['Case_Type_Name']))
                    elif sheet_name == 'dim_courts':
                        cursor.execute("""
                            INSERT IGNORE INTO dim_courts (Court_ID, Court_Name, Court_Location)
                            VALUES (%s, %s, %s)
                        """, (row['Court_ID'], row['Court_Name'], row['Court_Location']))
                    elif sheet_name == 'dim_judges':
                        cursor.execute("""
                            INSERT IGNORE INTO dim_judges (Judge_ID, Judge_Name, Experience_Years, Specialization, Assigned_Court)
                            VALUES (%s, %s, %s, %s, %s)
                        """, (row['Judge_ID'], row['Judge_Name'], row['Experience_Years'], row['Specialization'], row['Assigned_Court']))
                    elif sheet_name == 'dim_outcome_types':
                        cursor.execute("""
                            INSERT IGNORE INTO dim_outcome_types (Outcome_Type_ID, Outcome_Name, Description, Outcome_Type_Name)
                            VALUES (%s, %s, %s, %s)
                        """, (row['Outcome_Type_ID'], row['Outcome_Name'], row['Description'], row['Outcome_Type_Name']))
                    elif sheet_name == 'dim_parties_involved':
                        cursor.execute("""
                            INSERT IGNORE INTO dim_parties_involved (Party_ID, Party_Type, Gender, Age, Legal_Representation)
                            VALUES (%s, %s, %s, %s, %s)
                        """, (row['Party_ID'], row['Party_Type'], row['Gender'], row['Age'], row['Legal_Representation']))
                    elif sheet_name == 'dim_payment_status':
                        cursor.execute("""
                            INSERT IGNORE INTO dim_payment_status (Payment_Status_ID, Payment_Status_Name)
                            VALUES (%s, %s)
                        """, (row['Payment_Status_ID'], row['Payment_Status_Name']))
                    elif sheet_name == 'cases':
                        cursor.execute("""
                            INSERT IGNORE INTO cases (Case_ID, Case_Type, Case_Status, Filing_Date, Resolution_Date,
                                                   Cost_Type, Amount, Payment_Status, Outcome_Type, Resolution_Time,
                                                   Judge_ID, Court_Record_ID)
                        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
                        """, (row['Case_ID'], row['Case_Type'], row['Case_Status'], row['Filing_Date'],
                              row['Resolution_Date'], row['Cost_Type'], row['Amount'], row['Payment_Status'],
                              row['Outcome_Type'], row['Resolution_Time'], row['Judge_ID'], row['Court_Record_ID']))

        # Handle TXT files (tab-delimited)
        elif key.endswith(".txt"):
            table_name = key.split('.')[0]
            for index, row in df.iterrows():
                if table_name == 'dim_outcome_types':
                    cursor.execute("""
                        INSERT IGNORE INTO dim_outcome_types (Outcome_Type_ID, Outcome_Name, Description, Outcome_Type_Name)
                        VALUES (%s, %s, %s, %s)
                    """, (row['Outcome_Type_ID'], row['Outcome_Name'], row['Description'], row['Outcome_Type_Name']))
          

    # Commit the transaction
    connection.commit()
    print("Data committed to the database.")

    cursor.close()

# ETL Process
def etl_process():
    print("[Extracting data...]")
    data = extract_data_from_multiple_directories(data_directories)  
    print("Extracting Complete")

    # Connect to MySQL and load data
    connection = connect_to_database()  
    
    print("[Loading data into MySQL...]")
    load_data(connection, data)  
    print("ETL Process Completed Successfully!")

    connection.close()

if __name__ == "__main__":
    etl_process()
