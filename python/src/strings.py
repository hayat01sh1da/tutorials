def return_each_char(string):
    chars = []
    for i in range(0, len(string)):
        chars.append(string[i])
    return chars

def complete_proverb(adj1, adj2):
    return f'Stay {adj1}, stay {adj2}!'

def capitalise(sentence):
    words = sentence.split(' ')
    first_word = words[0].capitalize()
    words[0] = first_word
    return ' '.join(words)


def string_to_list(string):
    return string.split(' ')

def words_to_sentence(words):
    return ' '.join(words).replace(' .', '.')

def replace_char(sentence):
    return sentence.replace('s', '$')

def index_char(word):
    return word.index('m')

def python_str(phrase):
    return f'The phrase \'{phrase}\' in Nineteen-Eight Four scars me.'

def combine_words_1(word):
    return word + ' ' + word + ' ' + word

def combine_words_2(word):
    return (word + ' ') * 2 + word

def slice_sentence(sentence):
    i = sentence.index(',')
    return sentence[:i]
