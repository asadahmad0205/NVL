# NVL: MySQL to Snowflake Data Load Scripts
Welcome to the NVL repository! This project contains Python scripts designed to facilitate seamless data migration and synchronization from MySQL to Snowflake. The repository includes tools for both initial full data loads and incremental data loads, ensuring that your Snowflake data warehouse remains up-to-date with your MySQL source data.

# Overview
The NVL repository provides two main Python scripts:

# InitialFullLoadBulkfile.py:

# Purpose: Handles the initial bulk load of data from MySQL tables into Snowflake.
# Functionality:
Extracts data from MySQL tables.
Converts the extracted data into JSON format.
Uploads the JSON files to Snowflake and loads the data into corresponding tables.
Automatically manages the directory structure for organized file storage.
IncrementalDataLoad.py:

# Purpose: Manages incremental data loads by capturing real-time changes in the MySQL database and applying them to Snowflake.
Functionality:
Utilizes MySQL binary logs to track changes such as inserts, updates, and deletes.
Processes row events and dynamically renames columns to match Snowflake’s schema.
Ensures continuous synchronization of data with minimal latency.
Getting Started
Prerequisites
Ensure that you have the following dependencies installed:

Python 3.x
pymysql
pymysqlreplication
mysql-connector-python
snowflake-connector-python
pandas
You can install these dependencies using pip:

bash
Copy code
pip install pymysql pymysqlreplication mysql-connector-python snowflake-connector-python pandas
Installation
Clone the repository:

bash
Copy code
git clone https://github.com/asadahmad0205/NVL.git
cd NVL
Configure Database Connections:

Update the MySQL and Snowflake connection details in the scripts (InitialFullLoadBulkfile.py and IncrementalDataLoad.py) with your own credentials.
Run the Scripts:

For initial full load:
bash
Copy code
python InitialFullLoadBulkfile.py
For incremental data load:
bash
Copy code
python IncrementalDataLoad.py
Usage
InitialFullLoadBulkfile.py:

Use this script to perform a complete data load from MySQL to Snowflake.
The script will extract data from all tables in your MySQL database (except those explicitly excluded), convert the data into JSON files, and load them into Snowflake.
IncrementalDataLoad.py:

Use this script to keep your Snowflake data warehouse synchronized with your MySQL database by capturing and applying incremental changes.
The script continuously reads from the MySQL binary logs and updates Snowflake with any changes.
Contributing
Contributions are welcome! If you have suggestions for improvements or new features, feel free to open an issue or submit a pull request.

License
This project is licensed under the MIT License. See the LICENSE file for details.

Contact
For any questions or support, please contact Asad Ahmad.

