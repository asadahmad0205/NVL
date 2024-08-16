import datetime
import json
import pandas as pd
import pymysql
import warnings
import time
warnings.filterwarnings('ignore')
import mysql.connector
import json
import os
import snowflake.connector
# Snowflake Connection
conn = snowflake.connector.connect(
    user='aahmad0205',
    password='Password01@00',
    account='lvuzlqx-ee36638',
    warehouse='COMPUTE_WH',
    database='LDA',
    schema='RAW_LD'
)
# MySQL settings
# Connect to the MySQL database
db_connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Oracle#987654",
    database="db_1"
)


def load_to_stage(filefolder):
    cur = conn.cursor()
    cur.execute(filefolder)
    cur.close()
    
   

connection = pymysql.connect(host='localhost', user='root', password='Oracle#987654')
query = "SELECT distinct table_name FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'db_1' and table_type='BASE TABLE'   and table_name not in  ('sharepoint_updates_timestamps','audit','deal_rate_floors','forbury_calculator','ETL_CONTROL_T','REDEMPTIONS');"
column_name = pd.read_sql(query, connection)
cur = conn.cursor()
for index, col in column_name.iterrows():
    source_table_name=str(col['TABLE_NAME'])
    target_table_name='RAW_'+str(col['TABLE_NAME'])
    print(source_table_name+"----->"+target_table_name)
    query_source="select * from "+source_table_name+";"
    cursor = db_connection.cursor(dictionary=True)

# Execute a query to fetch all records from a table
    cursor.execute(query_source)
# Fetch all records
    records = cursor.fetchall()
# Ensure the output directory exists


    human_readable_date = datetime.datetime.now()
    output_dir =source_table_name+'/'+human_readable_date.strftime('%Y%m%d')+'/WriteRowsEvent'
    os.makedirs(output_dir, exist_ok=True)
    filext=str(human_readable_date.strftime('%Y%m%d%H%M%S'))
    file_name=source_table_name+filext+'.json'
    file_path = output_dir+'/'+file_name
#records['RECORD_GENERATED_AT']=human_readable_date
    with open(file_path, 'w') as json_file:
        json.dump(records, json_file, indent=20,default=str)
        put_command = "PUT file://"+file_path+" @"+output_dir+" OVERWRITE = TRUE AUTO_COMPRESS=false;"
        load_to_table = "copy into RAW_"+source_table_name+" from  @"+file_path+" FILE_FORMAT = (TYPE = 'JSON')  MATCH_BY_COLUMN_NAME=CASE_INSENSITIVE ;"
        load_json_raw="ALTER PIPE PIPE_RAW_JSON_DATA_"+source_table_name+" REFRESH;"
        load_to_stage(put_command)
    #cur.execute(load_to_table)
        cur.execute(load_json_raw)
print(f"Successfully created {len(records)} JSON files in the '{output_dir}' directory.")


