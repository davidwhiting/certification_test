import PySimpleGUI as sg
import sqlalchemy as db
import pandas as pd

## Query from the certification

engine = db.create_engine('mysql://root:root@127.0.0.1:8306/certification')
conn = engine.connect()
metadata = db.MetaData()
metadata.reflect(bind=engine)

query = "SELECT id, question, answer, correct, randomize, type, aota, nota, enabled FROM question_templates"
result = conn.execute(query).fetchall()
df = pd.DataFrame(result)
df.columns = result[0].keys()

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

#
#class Usarios:
#    def __init__(self, isusario, nome, telefone, email, usario, senha):
#        pass
#
#    def insertUser(self):
#        return 'User inserted'
#
#layout = [  [sg.Text('Question:', size=(25,1), justification='center', font=("Verdana", "12", "bold"))],
#            [sg.Text('ID:', size=(10,1), justification='right'), sg.Input(size=(14,1), key='-ID-', do_not_clear=False), sg.Button('Search')],
#            [sg.T('Name:', size=(10,1), justification='right'), sg.I(key='-NAME-', do_not_clear=False)],
#            [sg.T('Cell:', size=(10,1), justification='right'), sg.I(key='-CELL-', do_not_clear=False)],
#            [sg.T('E-mail:', size=(10,1), justification='right'), sg.I(key='-EMAIL-', do_not_clear=False)],
#            [sg.T('User:', size=(10,1), justification='right'), sg.I(key='-USER-', do_not_clear=False)],
#            [sg.T('Senha:', size=(10,1), justification='right'), sg.I(key='-SENHA-', do_not_clear=False)],
#            [sg.T(' '*8), sg.Button('Inserir'), sg.Button('Alterar'), sg.Button('Excluir')],
#            [sg.T(key='-MESSAGE-', size=(30,1), font=("Verdana", "9", "italic"))],
#            [sg.Text('Busca realizda com sucesso!',size=(30,1), justification='center', font=("Verdana", "10", "italic"))]]
#
#window = sg.Window('Question Template Edit', layout, font='Calibri 12', default_element_size=(25,1))
#
#while True:             # Event Loop
#    event, values = window.read()
#    print(event, values)
#    if event is None:
#        break
#    if event == 'Inserir':
#        user = Usarios(isusario=values['-USARIO-ID-'],
#                       nome=values['-NAME-'],
#                       telefone=values['-TELE-'],
#                       email=values['-EMAIL-'],
#                       usario=values['-USARIO-'],
#                       senha=values['-SENHA-'])
#        window['-MESSAGE-'].Update(user.insertUser())
#    else:
#        window['-MESSAGE-'].Update('Not yet implemlented')#