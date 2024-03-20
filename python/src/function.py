def cube():
    num = int(input('Input a number: '))
    return num ** 3

def return_str(str):
    return str

def introduce_self(name, lang_in_study, main_lang = 'Ruby'):
    return 'Hi, I am {} and stdying {} so hard.  My main proguramming language is {}'.format(name, lang_in_study, main_lang)

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
