import sqlite3
import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt

#%matplotlib inline
# Creating the connection to database
conn = sqlite3.connect('soccer.sqlite')
cursor = conn.cursor()

for row in cursor.execute("SELECT name FROM sqlite_master WHERE type='table';"):
    print(row)
    ('sqlite_sequence',)
    ('Player_Attributes',)
    ('Player',)
    ('Match',)
    ('League',)
    ('Country',)
    ('Team',)
    ('Team_Attributes',)

country_table = pd.read_sql_query("SELECT * FROM Country", conn)
league_table = pd.read_sql_query("SELECT * FROM League", conn)
match_table = pd.read_sql_query("SELECT * FROM Match", conn)
player_table = pd.read_sql_query("SELECT * FROM Player", conn)
player_att_table = pd.read_sql_query("SELECT * FROM Player_Attributes", conn)
team_table = pd.read_sql_query("SELECT * FROM Team", conn)
team_att_table = pd.read_sql_query("SELECT * FROM Team_Attributes", conn)

# Dimensions
player_table.shape

player_table.info()
player_table.head()

height_150 = pd.read_sql_query("SELECT * FROM Player WHERE height >= 150 ", conn)

# Relationship between Player's heights and weights in a  boxplot
sns.boxplot(data = player_table.loc[:,["height",'weight']])

# Relationship between Player's height and weight in a jointplot
sns.jointplot(x='height',y = 'weight',data = player_table,kind = 'scatter')

### 

import PySimpleGUI as sg

values = [['1','2','3'],['4','5','6']]
header = values[0]
usersTab = [[sg.Button('     ', key='Add User', button_color=sg.TRANSPARENT_BUTTON, border_width=0, )],
                    [sg.Table(values=values,auto_size_columns=False, headings=header)]]
logsTab = [[sg.T('Test Logs')]]

adminMainLayout = [[sg.TabGroup([[sg.Tab('Users', usersTab), sg.Tab('Logs', logsTab)]])]]

layout = adminMainLayout

window = sg.Window('My window', border_depth=0).Layout(layout)

window.Read()

