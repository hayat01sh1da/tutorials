def cube() -> int:
    num = int(input('Input a number: ').strip())
    return num ** 3

def return_str(str: str) -> str:
    return str

def introduce_self(name: str, lang_in_study: str, main_lang: str = 'Ruby') -> str:
    return f'Hi, I am {name} and stdying {lang_in_study} so hard. My main programming language is {main_lang}'

def halve(num: float) -> float:
    return num / 2

def fourfold(num: float) -> float:
    return num * 4

def calculate(num: float) -> float:
    value = halve(num)
    return fourfold(value)

def convert_to_float(str: str) -> float | str:
    try:
        return float(str)
    except(ValueError):
        return 'Invalid input.'
