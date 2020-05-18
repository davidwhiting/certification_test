import PySimpleGUI as sg

sg.theme('DarkAmber')    # Add a little colr

"""
  DESIGN PATTERN 1 - Single-shot window. Input field has a key.
"""

# 1- the layout

layout = [[sg.Text('My one-shot window.')],
          [sg.InputText(key='-IN-')],
          [sg.Submit(), sg.Cancel()]]

# 2 - the window

window = sg.Window('Window Title', layout)

# 3 - the read
event, values = window.read()

# 4 - the close
window.close()

# finally show the input value in a popup window
sg.popup('You entered', values['-IN-'])