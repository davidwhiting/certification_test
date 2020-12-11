## using templates and substitution

from jinja2 import Template

def th(n):
    if n > 20:
        digit = n - (n//10)*10
    else:
        digit = n
    switcher={
        1:'st',
        2:'nd',
        3:'rd'
        }
    return str(n) + switcher.get(digit,'th')

def nth(n, capital=False, number=False):
    switcher={
        1:'first',
        2:'second',
        3:'third',
        4:'fourth',
        5:'fifth',
        6:'sixth',
        7:'seventh',
        8:'eighth',
        9:'ninth',
        10:'tenth'
    }
    if n > 10:
        result = th(n)
    else:
        if number:
            result = th(n)
        else:
            result = switcher.get(n,'th')
            if capital:
                result = result.capitalize()
    return result    

blank = "_____"

variables = ["Height", "Weight"]

question = "The {{ nth }} most important variable is {{ variable }}"
template = Template(question)

template.render(important=important[0])

template = Template('Hello {{ name }}!')
template.render(name='David Whiting')
#'Hello David Whiting!'

template = Template('The answer is {{ answer }}.')
answers = [2.14, 3.765, 99.0]
answers[0]
#2.14
template.render(answer=answers[2])
'The answer is 99.0.' 

import random
import string

## Connect to mysql
import sqlalchemy as db
engine = create_engine('mysql://root:root@localhost:8085/certification')

## mysqlclient (a maintained fork of MySQL-Python)
#engine = create_engine('mysql+mysqldb://scott:tiger@localhost/foo')
#
## PyMySQL
#engine = create_engine('mysql+pymysql://scott:tiger@localhost/foo')
#engine = db.create_engine('dialect+driver://user:pass@host:port/db')


## Make a multiple choice question
##

# cursor.execute("INSERT INTO table VALUES (%s, %s, %s)", (var1, var2, var3))
# conn.escape_string()

##Don't do:
#
##sql = "INSERT INTO TABLE_A (COL_A,COL_B) VALUES (%s, %s)" % (val1, val2)
##cursor.execute(sql)
#
##Do:
#
##sql = "INSERT INTO TABLE_A (COL_A,COL_B) VALUES (%s, %s)"
##cursor.execute(sql, (val1, val2))

none = True # for "None of the above" questions

raw = ["For regression problems, which type of sampling will Driverless AI perform at the start of an experiment?",
    "Random", "Stratified", "Cluster", "Systematic"]

question = raw[0]
choices = raw[1:len(raw)]

w = 1 # which choice is correct, by default it is 1 
correct = choices[w-1] # by default, list correct option first

random.shuffle(choices)
if none:
    choices.append("None of the above") # append after shuffling

qprint = question
for i, choice in enumerate(choices):
    qprint += "\n" + string.ascii_lowercase[i] + ") " + choice



    q, a = make_multiple_choice(question, ["True", "False"], which)



make_multiple_choice(question, choices, none=True)

