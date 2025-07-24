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
        self.assertEqual(strings.return_each_char('Hello'), ['H', 'e', 'l', 'l', 'o'])

    # 2. Complete a sentence with 2 args to fill the placeholders
    def test_complete_proverb(self):
        self.assertEqual(strings.complete_proverb('hungry', 'foolish'), 'Stay hungry, stay foolish!')

    # 3. Capitalise
    def test_capitalise(self):
        self.assertEqual(strings.capitalise('aldous Huxley was born in 1894.'), 'Aldous Huxley was born in 1894.')

    # 4. Devide each word in a string and make a list
    def test_str_to_list(self):
        self.assertEqual(strings.string_to_list('When? Where? Who? What? How? Why?'), ['When?', 'Where?', 'Who?', 'What?', 'How?', 'Why?'])

    # 5. Combine words into a sentence, but remove a space before the period
    def test_words_to_sentence(self):
        self.assertEqual(strings.words_to_sentence(['The', 'fox', 'jumped', 'over', 'the', 'fence', '.']), ('The fox jumped over the fence.'))

    # 6. Replace 's' with '$' in a sentence
    def test_replace_char(self):
        self.assertEqual(strings.replace_char('A screaming comes across the sky.'), 'A $creaming come$ acro$$ the $ky.')

    # 7. Return the index of the initial 'm' in a word
    def test_index_char(self):
        self.assertEqual(2, strings.index_char('Hemingway'))

    # 8. Quote a phrase of your favourite book and make it Python string with quote
    def test_python_str(self):
        self.assertEqual(strings.python_str('two plus two makes five'), 'The phrase \'two plus two makes five\' in Nineteen-Eight Four scars me.')

    # 9. Make a sentence 'three three three' with '+' and '*' operator
    def test_combine_words(self):
        self.assertEqual(strings.combine_words_1('three'), 'three three three')
        self.assertEqual(strings.combine_words_2('three'), 'three three three')

    # 10. Extract a phrase before ',' in a sentence
    def test_slice_sentence(self):
        self.assertEqual(strings.slice_sentence('Before I die, I wish to watch aurora in Finland'), 'Before I die')

if __name__ == '__main__':
    unittest.main()
