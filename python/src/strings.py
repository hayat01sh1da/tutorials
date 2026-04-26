def return_each_char(string: str) -> list[str]:
    chars = []
    for i in range(0, len(string)):
        chars.append(string[i])
    return chars

def complete_proverb(adj1: str, adj2: str) -> str:
    return f'Stay {adj1}, stay {adj2}!'

def capitalise(sentence: str) -> str:
    words = sentence.split(' ')
    first_word = words[0].capitalize()
    words[0] = first_word
    return ' '.join(words)


def string_to_list(string: str) -> list[str]:
    return string.split(' ')

def words_to_sentence(words: list[str]) -> str:
    return ' '.join(words).replace(' .', '.')

def replace_char(sentence: str) -> str:
    return sentence.replace('s', '$')

def index_char(word: str) -> int:
    return word.index('m')

def python_str(phrase: str) -> str:
    return f'The phrase \'{phrase}\' in Nineteen-Eight Four scars me.'

def combine_words_1(word: str) -> str:
    return word + ' ' + word + ' ' + word

def combine_words_2(word: str) -> str:
    return (word + ' ') * 2 + word

def slice_sentence(sentence: str) -> str:
    i = sentence.index(',')
    return sentence[:i]
