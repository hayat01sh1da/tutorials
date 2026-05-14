import strings


def test_return_each_char():
    assert strings.return_each_char('Hello') == ['H', 'e', 'l', 'l', 'o']


def test_complete_proverb():
    assert strings.complete_proverb('hungry', 'foolish') == 'Stay hungry, stay foolish!'


def test_capitalise():
    assert strings.capitalise('aldous Huxley was born in 1894.') == \
        'Aldous Huxley was born in 1894.'


def test_string_to_list():
    assert strings.string_to_list('When? Where? Who? What? How? Why?') == \
        ['When?', 'Where?', 'Who?', 'What?', 'How?', 'Why?']


def test_words_to_sentence():
    assert strings.words_to_sentence(
        ['The', 'fox', 'jumped', 'over', 'the', 'fence', '.'],
    ) == 'The fox jumped over the fence.'


def test_replace_char():
    assert strings.replace_char('A screaming comes across the sky.') == \
        'A $creaming come$ acro$$ the $ky.'


def test_index_char():
    assert strings.index_char('Hemingway') == 2


def test_python_str():
    assert strings.python_str('two plus two makes five') == \
        "The phrase 'two plus two makes five' in Nineteen-Eight Four scars me."


def test_combine_words():
    assert strings.combine_words_1('three') == 'three three three'
    assert strings.combine_words_2('three') == 'three three three'


def test_slice_sentence():
    assert strings.slice_sentence('Before I die, I wish to watch aurora in Finland') == \
        'Before I die'
