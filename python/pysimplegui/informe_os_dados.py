import PySimpleGUI as sg

class Usarios:
    def __init__(self, isusario, nome, telefone, email, usario, senha):
        pass

    def insertUser(self):
        return 'User inserted'

layout = [  [sg.Text('Informe os dados:', size=(25,1), justification='center', font=("Verdana", "10", "bold"))],
            [sg.Text('idUsario:', size=(10,1), justification='right'), sg.Input(size=(14,1), key='-USARIO-ID-', do_not_clear=False), sg.Button('Buscar')],
            [sg.T('Nome:', size=(10,1), justification='right'), sg.I(key='-NOME-', do_not_clear=False)],
            [sg.T('Telefone:', size=(10,1), justification='right'), sg.I(key='-TELE-', do_not_clear=False)],
            [sg.T('E-mail:', size=(10,1), justification='right'), sg.I(key='-EMAIL-', do_not_clear=False)],
            [sg.T('Usario:', size=(10,1), justification='right'), sg.I(key='-USARIO-', do_not_clear=False)],
            [sg.T('Senha:', size=(10,1), justification='right'), sg.I(key='-SENHA-', do_not_clear=False)],
            [sg.T(' '*8), sg.Button('Inserir'), sg.Button('Alterar'), sg.Button('Excluir')],
            [sg.T(key='-MESSAGE-', size=(30,1), font=("Verdana", "9", "italic"))],
            [sg.Text('Busca realizda com sucesso!',size=(30,1), justification='center', font=("Verdana", "10", "italic"))]]

window = sg.Window('Informe Os Dados', layout, font='Calibri 10', default_element_size=(25,1))

while True:             # Event Loop
    event, values = window.read()
    print(event, values)
    if event is None:
        break
    if event == 'Inserir':
        user = Usarios(isusario=values['-USARIO-ID-'],
                       nome=values['-NOME-'],
                       telefone=values['-TELE-'],
                       email=values['-EMAIL-'],
                       usario=values['-USARIO-'],
                       senha=values['-SENHA-'])
        window['-MESSAGE-'].Update(user.insertUser())
    else:
        window['-MESSAGE-'].Update('Not yet implemlented')