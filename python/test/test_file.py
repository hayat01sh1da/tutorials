import unittest
import contextlib
import sys
sys.path.append('./src')
import file

class redirect_stdin(contextlib._RedirectStream):
    _stream = 'stdin'

class TestFile(unittest.TestCase):
    # 1. Read the contents of a file
    def test_read_file(self):
        self.assertEqual('Hogehoge\nFoobar\n', file.read_file('./file/read_file.txt'))

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
            'Top Gun,Risky Business,Minority Report\nTitanic,The Revenant,Interception\nTraining Day,Man on Fire,Flight\n',
            file.write_csv('./file/write_file.csv', data)
        )

if __name__ == '__main__':
    unittest.main()
