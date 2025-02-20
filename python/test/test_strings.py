import unittest
import sys
import glob
import os
import shutil
sys.path.append('./src')
import strings

class TesStrings(unittest.TestCase):
    def setUp(self):
        self.pycaches = glob.glob(os.path.join('.', '**', '__pycache__'), recursive = True)

    def tearDown(self):
        for pycache in self.pycaches:
            if os.path.exists(pycache):
                shutil.rmtree(pycache)

    # 1. Return each char in a string
    def test_return_each_char(self):
        self.assertEqual(['H', 'e', 'l', 'l', 'o'], strings.return_each_char('Hello'))

    # 2. Complete a sentence with 2 args to fill the placeholders
    def test_complete_proverb(self):
        self.assertEqual('Stay hungry, stay foolish!', strings.complete_proverb('hungry', 'foolish'))

    # 3. Capitalise
    def test_capitalise(self):
        self.assertEqual('Aldous Huxley was born in 1894.', strings.capitalise('aldous Huxley was born in 1894.'))

    # 4. Devide each word in a string and make a list
    def test_str_to_list(self):
        self.assertEqual(['When?', 'Where?', 'Who?', 'What?', 'How?', 'Why?'], strings.string_to_list('When? Where? Who? What? How? Why?'))

    # 5. Combine words into a sentence, but remove a space before the period
    def test_words_to_sentence(self):
        self.assertEqual('The fox jumped over the fence.', strings.words_to_sentence(['The', 'fox', 'jumped', 'over', 'the', 'fence', '.']))

    # 6. Replace 's' with '$' in a sentence
    def test_replace_char(self):
        self.assertEqual('A $creaming come$ acro$$ the $ky.', strings.replace_char('A screaming comes across the sky.'))

    # 7. Return the index of the initial 'm' in a word
    def test_index_char(self):
        self.assertEqual(2, strings.index_char('Hemingway'))

    # 8. Quote a phrase of your favourite book and make it Python string with quote
    def test_python_str(self):
        self.assertEqual('The phrase \'two plus two makes five\' in Nineteen-Eight Four scars me.', strings.python_str('two plus two makes five'))

    # 9. Make a sentence 'three three three' with '+' and '*' operator
    def test_combine_words(self):
        self.assertEqual('three three three', strings.combine_words_1('three'))
        self.assertEqual('three three three', strings.combine_words_2('three'))

    # 10. Extract a phrase before ',' in a sentence
    def test_slice_sentence(self):
        self.assertEqual('Before I die', strings.slice_sentence('Before I die, I wish to watch aurora in Finland'))

if __name__ == '__main__':
    unittest.main()
