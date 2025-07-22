def return_three_strings(string1, string2, string3):
    return f'string1: {string1}, string2: {string2}, string3: {string3}'

def judge_num_1(num):
    if num >= 10:
        return 'Number is 10 or more.'
    else:
        return 'Number is less then 10.'

def judge_num_2(num):
    if num > 25:
        return 'Number is more than 25.'
    elif num <= 10:
        return 'Number is 10 or less.'
    else:
        return 'Number more than 10 and 25 or less.'

def print_remainder(num1, num2):
    return num1 % num2

def print_quotient(num1, num2):
    return num1 % num2

def judge_age(age):
    if age >= 40:
        return 'Now you must start paying a healthcare insurace tax.'
    elif age >= 20:
        return 'You are legally allowed to drink.'
    else:
        return 'You are a teen.'
