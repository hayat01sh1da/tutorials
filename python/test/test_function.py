import unittest
import contextlib
import sys
import glob
import os
import shutil
sys.path.append('./src')
import function

class redirect_stdin(contextlib._RedirectStream):
    _stream = 'stdin'

class TestFunction(unittest.TestCase):
    def setUp(self):
        self.pycaches = glob.glob(os.path.join('.', '**', '__pycache__'), recursive = True)

    def tearDown(self):
        for pycache in self.pycaches:
            if os.path.exists(pycache):
                shutil.rmtree(pycache)

    # 1. Square an input number
    def _calFUT(self):
        return function.cube()

    def test_cube(self):
        from io import StringIO
        buf = StringIO()
        buf.write('2\n')
        buf.seek(0)

        with redirect_stdin(buf):
            actual = self._calFUT()

        self.assertEqual(8, actual)

    # 2. Return a string taken as an arguement
    def test_return_str(self):
        self.assertEqual(function.return_str('Python'), 'Python')

    # 3. Return a message with 3 required args and 2 optional arg
    def test_introduce_self(self):
        self.assertEqual(function.introduce_self('Oasist', 'Python'), 'Hi, I am Oasist and stdying Python so hard. My main programming language is Ruby')

    # 4. Define a function which halves an int arg.
    #    Define another function which fourfold an int arg.
    #    Call these functions in the other function and caluculate it.
    def test_calculate(self):
        self.assertEqual(function.calculate(10), 20)

    # 5. Convert an input string to float and raise all expected exceptions
    def test_convert_to_float(self):
        self.assertEqual(function.convert_to_float('99.99'), 99.99)
        self.assertEqual(function.convert_to_float('Hoge'), 'Invalid input.')

if __name__ == '__main__':
    unittest.main()
