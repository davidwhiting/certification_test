import PySimpleGUI as sg
import sqlalchemy as db
import pandas as pd

sg.change_look_and_feel('GreenTan')

## Get pandas df from query

engine = db.create_engine('mysql://root:root@127.0.0.1:8306/certification')
conn = engine.connect()
metadata = db.MetaData()
metadata.reflect(bind=engine)

query = "SELECT id, question, answer, correct, randomize, type, aota, nota, enabled FROM question_templates"
result = conn.execute(query).fetchall()
df = pd.DataFrame(result)
df.columns = result[0].keys()

## Display in PySimpleGUI

header_list = df.columns.tolist()
data = df.values.tolist()

sg.set_options(auto_size_buttons=True)

layout = [
    [sg.Table(values=data,
              headings=header_list,
              display_row_numbers=False,
              auto_size_columns=True,
              num_rows=min(250, len(data)))]
    ]

window = sg.Window('Table', layout, font='Default 14', grab_anywhere=False)
event, values = window.read()
window.close()