def cube():
    num = int(input('Input a number: '))
    return num ** 3

def return_str(str):
    return str

def introduce_self(name, lang_in_study, main_lang = 'Ruby'):
    return f'Hi, I am {name} and stdying {lang_in_study} so hard. My main programming language is {main_lang}'

def halve(num):
    return num / 2

def fourfold(num):
    return num * 4

def calculate(num):
    value = halve(num)
    return fourfold(value)

def convert_to_float(str):
    try:
        return float(str)
    except(ValueError):
        return 'Invalid input.'
