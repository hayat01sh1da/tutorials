import unittest
import contextlib
import sys
import glob
import os
import shutil
sys.path.append('./src')
import file

class redirect_stdin(contextlib._RedirectStream):
    _stream = 'stdin'

class TestFile(unittest.TestCase):
    def setUp(self):
        self.pycaches = glob.glob(os.path.join('.', '**', '__pycache__'), recursive = True)

    def tearDown(self):
        for pycache in self.pycaches:
            if os.path.exists(pycache):
                shutil.rmtree(pycache)

    # 1. Read the contents of a file
    def test_read_file(self):
        self.assertEqual(file.read_file('./file/read_file.txt'), 'Hogehoge\nFoobar\n')

    # 2. Write an input value on a file
    def _calFUT(self):
        return file.write_file('./file/write_file.txt')

    def test_write_file(self):
        from io import StringIO
        buf = StringIO()
        buf.write('Foobar\n')
        buf.seek(0)

        with redirect_stdin(buf):
            actual = self._calFUT()

        self.assertEqual('Foobar', actual)

    # 3. Write a CSV with data
    def test_write_csv(self):
        data = [
            [
                'Top Gun',
                'Risky Business',
                'Minority Report'
            ],
            [
                'Titanic',
                'The Revenant',
                'Interception'
            ],
            [
                'Training Day',
                'Man on Fire',
                'Flight'
            ]
        ]
        self.assertEqual(
            file.write_csv('./file/write_file.csv', data),
            'Top Gun,Risky Business,Minority Report\nTitanic,The Revenant,Interception\nTraining Day,Man on Fire,Flight\n'
        )

if __name__ == '__main__':
    unittest.main()
