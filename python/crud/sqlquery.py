import os
import sqlite3
import pandas as pd

data_url = 'https://people.sc.fsu.edu/~jburkardt/data/csv/addresses.csv'
headers = ['first_name', 'last_name', 'address', 'city', 'state', 'zip']
data_table = pd.read_csv(data_url, header=None, names=headers, converters={'zip': str})

# Clear example.db if it exists
if os.path.exists('example.db'):
    os.remove('example.db')

# Create a database
conn = sqlite3.connect('example.db')

# Add the data to our database
data_table.to_sql('data_table', conn, dtype={
    'first_name': 'VARCHAR(256)',
    'last_name': 'VARCHAR(256)',
    'address': 'VARCHAR(256)',
    'city': 'VARCHAR(256)',
    'state': 'VARCHAR(2)',
    'zip': 'VARCHAR(5)'
    })

conn.row_factory = sqlite3.row_factory

# Make convenience functions for running SQL queries
def sql_query(query):
    cur = conn.cursor()
    cur.execute(query)
    rows = cur.fetchall()
    return rows

def sql_edit_insert(query, var):
    cur = conn.cursor()
    cur.execute(query, var)
    conn.commit()

def sql_delete(query, var):
    cur = conn.cursor()
    cur.execute(query, var)

def sql_query2(query, var):
    cur = conn.cursor()
    cur.execute(query, var)
    rows = cur.fetchall()
    return rows

##############

import sqlite3
conn = sqlite3.connect('database.sqlite')
cursor = conn.cursor

## a bunch of commands

### create table
cursor.execute('''CREATE TABLE SCHOOL
         (ID INT PRIMARY KEY     NOT NULL,
         NAME           TEXT    NOT NULL,
         AGE            INT     NOT NULL,
         ADDRESS        CHAR(50),
         MARKS          INT);''')

### insert into table
cursor.execute("INSERT INTO SCHOOL (ID,NAME,AGE,ADDRESS,MARKS) \
      VALUES (1, 'Rohan', 14, 'Delhi', 200)");
cursor.execute("INSERT INTO SCHOOL (ID,NAME,AGE,ADDRESS,MARKS) \
      VALUES (2, 'Allen', 14, 'Bangalore', 150 )");
cursor.execute("INSERT INTO SCHOOL (ID,NAME,AGE,ADDRESS,MARKS) \
      VALUES (3, 'Martha', 15, 'Hyderabad', 200 )");
cursor.execute("INSERT INTO SCHOOL (ID,NAME,AGE,ADDRESS,MARKS) \
      VALUES (4, 'Palak', 15, 'Kolkata', 650)");

for row in cursor.execute("SELECT id, name, marks from SCHOOL"):
    print("ID = ", row[0])
    print("NAME = ", row[1])
    print("MARKS = ", row[2], "\n")

### update values in table
conn.execute("UPDATE SCHOOL set MARKS = 250 where ID = 3")
conn.commit()

for row in cursor.execute("SELECT id, name, address, marks from SCHOOL"):
    print("ID = ", row[0])
    print("NAME = ", row[1])    
    print("MARKS = ", row[2], "\n")

### delete values
conn.execute("DELETE from  SCHOOL where ID = 2")
conn.commit()
for row in cursor.execute("SELECT id, name, address, marks from SCHOOL"):
    print("ID = ", row[0])
    print("NAME = ", row[1])
    print("ADDRESS = ", row[2])
    print("MARKS = ", row[3], "\n")

cursor.close()

conn.commit()
conn.close()

