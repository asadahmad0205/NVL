from pymysqlreplication import BinLogStreamReader
from pymysqlreplication.row_event import DeleteRowsEvent, UpdateRowsEvent, WriteRowsEvent
import datetime
import json
import pandas as pd
import pymysql
import warnings
import time
warnings.filterwarnings('ignore')
import os
import snowflake.connector
# Snowflake Connection
conn = snowflake.connector.connect(
    user='aahmad0205',
    password='Password01@00',
    account='lvuzlqx-ee36638',
    warehouse='COMPUTE_WH',
    database='LDA',
    schema='STG_LD'
)
# MySQL settings
mysql_settings = {
    'host': '127.0.0.1',
    'port': 3306,
    'user': 'root',
    'passwd': 'Oracle#987654'
}

# Define the stream
stream = BinLogStreamReader(
    connection_settings=mysql_settings,
    server_id=1,
    only_events=[DeleteRowsEvent, UpdateRowsEvent, WriteRowsEvent],
    #auto_position='121',
    is_mariadb=True,
    resume_stream=True,
    blocking=True,
    annotate_rows_event=True,
)

def load_to_stage(filefolder):
    cur = conn.cursor()
    cur.execute(filefolder)
    
    

current_binlog_file = stream.log_file
current_position = stream.log_pos

print(f"Current binlog file: {current_binlog_file}")
print(f"Current position: {current_position}")
def Rename_table_column(nested_dict, old_key, new_key):

    new_dict = {}
    for key, value in nested_dict.items():
        if key == old_key:
            new_dict[new_key] = value
        elif isinstance(value, dict):
            new_dict[key] = Rename_table_column(value, old_key, new_key)
        else:
            new_dict[key] = value
    return new_dict


connection = pymysql.connect(host='localhost', user='root', password='Oracle#987654')
#query = "SELECT COLUMN_NAME,table_name FROM INFORMATION_SCHEMA.COLUMNS  order by table_name,ordinal_position;"
#column_name = pd.read_sql(query, connection)
#print(column_name[column_name['TABLE_NAME']=="accounts"]['COLUMN_NAME'])
# Read the binlog stream
for binlogevent in stream:
    query = "SELECT COLUMN_NAME,table_name FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = '"+binlogevent.schema+"' AND TABLE_NAME = '"+binlogevent.table+"' order by ordinal_position;"
    column_name = pd.read_sql(query, connection)
    cur = conn.cursor()    
    for row in binlogevent.rows:
    
        
        #for index, col in column_name.iterrows():
            #Renaming the column name dynamically
            #print('UNKNOWN_COL'+str(index) + col['COLUMN_NAME'])
        #    row = Rename_table_column(row,'UNKNOWN_COL'+str(index),col['COLUMN_NAME'])
        event = {"time_stamp":binlogevent.timestamp,"schema_name": binlogevent.schema, "table_name": binlogevent.table}
        if str(type(binlogevent).__name__)=='UpdateRowsEvent':
            c2=str(row["before_values"]['UNKNOWN_COL0'])
            change_id= str(row['after_values']['UNKNOWN_COL0']) 
        else :
            change_id= str(row['values']['UNKNOWN_COL0']) 
        
        for index, col in column_name.iterrows():
            if isinstance(binlogevent, DeleteRowsEvent):
                event["action"] = "delete"
                event[str(col['COLUMN_NAME'])]=str(row["values"]['UNKNOWN_COL'+str(index)])
            elif isinstance(binlogevent, UpdateRowsEvent):
                event["action"] = "update"
                event[str(col['COLUMN_NAME'])]=str(row["before_values"]['UNKNOWN_COL'+str(index)])
                event[str(col['COLUMN_NAME'])]=str(row["after_values"]['UNKNOWN_COL'+str(index)])
            elif isinstance(binlogevent, WriteRowsEvent):
                event["action"] = "insert"
                event[str(col['COLUMN_NAME'])]=str(row["values"]['UNKNOWN_COL'+str(index)])
        
            
        human_readable_date = datetime.datetime.fromtimestamp(binlogevent.timestamp)

        formatted_date =human_readable_date.strftime('%Y-%m-%d %H:%M:%S')
        folder = binlogevent.table+'/'+human_readable_date.strftime('%Y')+'/'+human_readable_date.strftime('%m')+'/'+human_readable_date.strftime('%d')+'/'+type(binlogevent).__name__        
        table_name=str(binlogevent.table)
        putfolder ='stage/'+binlogevent.table
        schema_name=str(binlogevent.schema)
        file_namecsv=table_name+change_id+str(human_readable_date.strftime('%Y%m%d%H%M%S'))+'.csv'
        file_namejson=table_name+change_id+str(human_readable_date.strftime('%Y%m%d%H%M%S'))+'.json'
        os.makedirs(folder, exist_ok=True)
        file_pathjson = os.path.join(folder, file_namejson)
        file_pathcsv = os.path.join(folder, file_namecsv)
        loaddatafile=folder+'/'+file_namejson
        with open(file_pathjson, 'w') as file:
            json.dump(event, file,indent=20)
            put_command = "PUT file://"+file_pathjson+" @"+folder+" OVERWRITE = TRUE AUTO_COMPRESS=false;"
            load_to_table = "copy into "+table_name+" from  @"+loaddatafile+" FILE_FORMAT = (TYPE = 'JSON')  MATCH_BY_COLUMN_NAME=CASE_INSENSITIVE ;"
            load_json_raw="ALTER PIPE PIPE_RAW_JSON_DATA_"+table_name+" REFRESH;"
            #time.sleep(3)
            #time.sleep(1)
            #load_to_stage(put_command)
            #time.sleep(0.5)
            #   cur.execute(load_to_table)
        print(event)
        #time.sleep(1)
        load_to_stage(put_command)
        #time.sleep(0.5)
        cur.execute(load_to_table)
        cur.execute(load_json_raw)
    #put_command = "PUT file://"+file_pathjson+" @STAGING_LAYER/"+folder+" OVERWRITE = TRUE;"
    #load_to_table = "copy into "+table_name+" from  @STAGING_LAYER/"+folder+" FILE_FORMAT = (TYPE = 'JSON')  MATCH_BY_COLUMN_NAME=CASE_INSENSITIVE  ON_ERROR=CONTINUE;"   
            #time.sleep(3)
    #cur.execute(put_command)
            #time.sleep(3)
    #cur.execute(load_to_table)



# Close the stream when done
stream.close()
