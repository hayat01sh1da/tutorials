def return_each_char(str):
    chars = []
    for i in range(0, len(str)):
        chars.append(str[i])
    return chars

def complete_proverb(adj1, adj2):
    return 'Stay {}, stay {}!'.format(adj1, adj2)

def capitalise(sentense):
    words = sentense.split(' ')
    first_word = words[0].capitalize()
    words[0] = first_word
    return ' '.join(words)

def str_to_list(str):
    return str.split(' ')

def words_to_sentense(words):
    return ' '.join(words).replace(' .', '.')

def replace_char(sentense):
    return sentense.replace('s', '$')

def index_char(word):
    return word.index('m')

def python_str(phrase):
    return 'The phrase \'{}\' in Nineteen-Eight Four scars me.'.format(phrase)

def combine_words_1(word):
    return word + ' ' + word + ' ' + word

def combine_words_2(word):
    return (word + ' ') * 2 + word

def slice_sentense(sentense):
    i = sentense.index(',')
    return sentense[:i]
