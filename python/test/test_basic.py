import unittest
import sys
import glob
import os
import shutil
sys.path.append('./src')
import basic

class TestBasic(unittest.TestCase):
    def setUp(self):
        self.pycaches = glob.glob(os.path.join('.', '**', '__pycache__'), recursive = True)

    def tearDown(self):
        for pycache in self.pycaches:
            if os.path.isdir(pycache):
                shutil.rmtree(pycache)

    # 1. Print 3 different strings
    def test_return_three_strings(self):
        self.assertEqual('string1: Ruby, string2: Python, string3: Go lang', basic.return_three_strings('Ruby', 'Python', 'Go lang'))

    # 2. If a variable is less then 10, print a message.
    #    If a variable is 10 or more, print another.
    def test_judge_num_1(self):
        self.assertEqual('Number is 10 or more.', basic.judge_num_1(11))
        self.assertEqual('Number is 10 or more.', basic.judge_num_1(10))
        self.assertEqual('Number is less then 10.', basic.judge_num_1(9))

    # 3. If a variable is 10 or less, print a message.
    #    If a variable is more than 10 and 25 or less, print another.
    #    If a variable is more than 25, print another.
    def test_judge_num_2(self):
        self.assertEqual('Number is more than 25.', basic.judge_num_2(26))
        self.assertEqual('Number more than 10 and 25 or less.', basic.judge_num_2(25))
        self.assertEqual('Number more than 10 and 25 or less.', basic.judge_num_2(18))
        self.assertEqual('Number is 10 or less.', basic.judge_num_2(10))
        self.assertEqual('Number is 10 or less.', basic.judge_num_2(9))

    # 4. Divide a number by another and print the remainder
    def test_print_remainder(self):
        self.assertEqual(2, basic.print_remainder(29, 3))

    # 5. Divide a number by another and print the quotient
    def test_print_remainder(self):
        self.assertEqual(2, basic.print_remainder(29, 3))

    # 6. Assign an integer to a variable `age`.
    #    Process it with a conditional statement
    def test_judge_age(self):
        self.assertEqual('Now you must start paying a healthcare insurace tax.', basic.judge_age(41))
        self.assertEqual('Now you must start paying a healthcare insurace tax.', basic.judge_age(40))
        self.assertEqual('You are legally allowed to drink.', basic.judge_age(39))
        self.assertEqual('You are legally allowed to drink.', basic.judge_age(20))
        self.assertEqual('You are a teen.', basic.judge_age(19))

if __name__ == '__main__':
    unittest.main()
