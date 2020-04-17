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