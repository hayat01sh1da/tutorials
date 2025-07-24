import unittest
import sys
import contextlib
import glob
import os
import shutil
sys.path.append('./src')
import loop

class redirect_stdin(contextlib._RedirectStream):
    _stream = 'stdin'

class TestLoop(unittest.TestCase):
    def setUp(self):
        self.pycaches = glob.glob(os.path.join('.', '**', '__pycache__'), recursive = True)

    def tearDown(self):
        for pycache in self.pycaches:
            if os.path.exists(pycache):
                shutil.rmtree(pycache)

    # 1. Print TV dramas by looping a list
    def _calFUT1(self):
        return loop.print_tv_dramas(['The Walking Dead', 'Entourage', 'The Sopranos', 'Vampire Diaries'])

    def test_print_tv_dramas(self):
        from io import StringIO
        buf = StringIO()

        with contextlib.redirect_stdout(buf):
            self._calFUT1()

        actual = buf.getvalue()
        self.assertEqual(actual, 'The Walking Dead\nEntourage\nThe Sopranos\nVampire Diaries\n')

    # 2. Print 25 - 50
    def _calFUT2(self):
        return loop.print_nums(range(1, 11))

    def test_print_nums(self):
        from io import StringIO
        buf = StringIO()

        with contextlib.redirect_stdout(buf):
            self._calFUT2()

        actual = buf.getvalue()
        self.assertEqual(actual, '1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n')

    # 3. Print TV dramas by looping a list with index
    def _calFUT3(self):
        return loop.print_tv_dramas_with_index(['The Walking Dead', 'Entourage', 'The Sopranos', 'Vampire Diaries'])

    def test_print_tv_dramas_with_index(self):
        from io import StringIO
        buf = StringIO()

        with contextlib.redirect_stdout(buf):
            self._calFUT3()

        actual = buf.getvalue()
        self.assertEqual(actual, '1: The Walking Dead\n2: Entourage\n3: The Sopranos\n4: Vampire Diaries\n')

    # 4. Print a message according to an input number.
    #    If the number is expected, print 'Congratulations!' and exit.
    #    If the number is unexpected, print 'Try it again!' and continue.
    #    If the input value is not a number, print 'Input a number or 'q': ' and  continue.
    #    If the input value is 'q', exit.
    # TODO: Test stdin
    def _calFUT4(self):
        return loop.guess_num(1)

    def test_guess_num(self):
        from io import StringIO
        buf = StringIO()
        # buf.write('1\n')
        # buf.seek(0)

        with contextlib.redirect_stdout(buf):
            self._calFUT4()

        actual = buf.getvalue()
        self.assertEqual(actual, 'Congratulations!\n')

    # 5. Matrix of 2 lists
    def test_matrix(self):
        self.assertEqual(
            loop.matrix([8, 19, 148, 4], [9, 1, 33, 83]),
            [72, 8, 264, 664, 171, 19, 627, 1577, 1332, 148, 4884, 12284, 36, 4, 132, 332]
        )

if __name__ == '__main__':
    unittest.main()
