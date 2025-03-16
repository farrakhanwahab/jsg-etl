# **ETL Project for Judicial Service of Ghana**

## **Project Overview**

This project implements an **Extract, Transform, Load (ETL)** pipeline for the **Judicial Service of Ghana**. 
The pipeline extracts data from various sources (CSV, Excel, and JSON files), transforms it into a consistent 
format, and loads it into a MySQL database for storage and analysis. Additionally, an interactive dashboard 
provides insights and metrics for data-driven decision-making.

---

## **Features**
- **Data Extraction**: Reads data from multiple file formats (CSV, Excel, JSON).  
- **Data Transformation**: Cleans and standardizes data for accuracy and consistency.  
- **Data Loading**: Stores transformed data into a structured MySQL database.  
- **Interactive Dashboard**: Visualizes key performance indicators and statistics for the Judicial Service.  

---

## **How to Run the Project**

### **Step 1: Set Up the Environment**

#### **1. Install Python**  
Ensure Python 3.9 or later is installed. You can download it from [python.org](https://www.python.org/).  

#### **2. Create the Virtual Environment**  
Navigate to the project directory and create a virtual environment named `etl_project`:
python -m venv etl_project

Enter the virtusl environment:
cd etl_project

#### **3. Activate the Virtual Environment**  
source etl_project/bin/activate         on MAC
etl_project\Scripts\activate            on WINDOWS

Grant permission if needed:
chmod +x etl_project/bin/activate

#### **4. Install Required Libraries**  
Install the dependencies specified in `requirements.txt`
pip install -r requirements.txt


### **Step 2: Configure the MySQL Database**

#### **1. Install MySQL**  
Ensure MySQL is installed. If you are using XAMPP, start the MySQL service.

#### **2. Create the Database**  
Open your MySQL client and run the following command to create the database:
CREATE DATABASE judicial_dw;
USE judicial_dw;

#### **3. Create Tables**  
Use the commands in the `SQL Tables.txt` file to set up the tables

`The Database is provided in the Directory`

### **Step 3: Run the ETL Process**
python etl_process.py

To view the interactive dashboard, run the dashboard.py file:
streamlit run dashboard.py
