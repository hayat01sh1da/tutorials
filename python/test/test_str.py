import unittest
import sys
import glob
import os
import shutil
sys.path.append('./src')
import str

class TesStr(unittest.TestCase):
    def setUp(self):
        self.pycaches = glob.glob(os.path.join('.', '**', '__pycache__'), recursive = True)

    def tearDown(self):
        for pycache in self.pycaches:
            if os.path.isdir(pycache):
                shutil.rmtree(pycache)

    # 1. Return each char in a string
    def test_return_each_char(self):
        self.assertEqual(['H', 'e', 'l', 'l', 'o'], str.return_each_char('Hello'))

    # 2. Complete a sentense with 2 args to fill the placeholders
    def test_complete_proverb(self):
        self.assertEqual('Stay hungry, stay foolish!', str.complete_proverb('hungry', 'foolish'))

    # 3. Capitalise
    def test_capitalise(self):
        self.assertEqual('Aldous Huxley was born in 1894.', str.capitalise('aldous Huxley was born in 1894.'))

    # 4. Devide each word in a string and make a list
    def test_str_to_list(self):
        self.assertEqual(['When?', 'Where?', 'Who?', 'What?', 'How?', 'Why?'], str.str_to_list('When? Where? Who? What? How? Why?'))

    # 5. Combine words into a sentense, but remove a space before the period
    def test_words_to_sentense(self):
        self.assertEqual('The fox jumped over the fence.', str.words_to_sentense(['The', 'fox', 'jumped', 'over', 'the', 'fence', '.']))

    # 6. Replace 's' with '$' in a sentense
    def test_replace_char(self):
        self.assertEqual('A $creaming come$ acro$$ the $ky.', str.replace_char('A screaming comes across the sky.'))

    # 7. Return the index of the initial 'm' in a word
    def test_index_char(self):
        self.assertEqual(2, str.index_char('Hemingway'))

    # 8. Quote a phrase of your favourite book and make it Python string with quote
    def test_python_str(self):
        self.assertEqual('The phrase \'two plus two makes five\' in Nineteen-Eight Four scars me.', str.python_str('two plus two makes five'))

    # 9. Make a sentense 'three three three' with '+' and '*' operator
    def test_combine_words(self):
        self.assertEqual('three three three', str.combine_words_1('three'))
        self.assertEqual('three three three', str.combine_words_2('three'))

    # 10. Extract a phrase before ',' in a sentense
    def test_slice_sentense(self):
        self.assertEqual('Before I die', str.slice_sentense('Before I die, I wish to watch aurora in Finland'))

if __name__ == '__main__':
    unittest.main()
