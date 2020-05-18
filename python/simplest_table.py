import PySimpleGUI as sg
#import PySimpleGUIWeb as sg

values = [
    ['1','2','3'],
    ['4','5','6']
    ]
header = values[0]
usersTab = [
    [sg.Button('     ', key='Add User', button_color=sg.TRANSPARENT_BUTTON, border_width=0, )],
    [sg.Table(values=values,auto_size_columns=False, headings=header)]]
logsTab = [[sg.T('Test Logs')]]

adminMainLayout = [[sg.TabGroup([[sg.Tab('Users', usersTab), sg.Tab('Logs', logsTab)]])]]

layout = adminMainLayout

window = sg.Window('My window', border_depth=0).Layout(layout)

window.Read()

