import PySimpleGUI as sg

sg.change_look_and_feel('DarkAmber')   # Add a little color for fun

layout =  [[sg.Text('My To Do List', font='Helvetica 15')]]  # a title line t
layout += [[sg.Text(f'{i}. '), sg.CBox(''), sg.Input()] for i in range(1, 6)]  # the checkboxes and descriptions
layout += [[sg.Button('Save'), sg.Button('Load'), sg.Button('Exit')]]  # the buttons

window = sg.Window('To Do List Example', layout)

while True:
    event, values = window.read()
    if event in (None, 'Exit'):
        break
    elif event == 'Save':
        window.save_to_disk('mywindow.out')
    elif event == 'Load':
        window.load_from_disk('mywindow.out')
window.close()
