import unittest
import sys
import glob
import os
import shutil
sys.path.append('./src')
from square import Square

class TestSquare(unittest.TestCase):
    def setUp(self):
        self.pycaches = glob.glob(os.path.join('.', '**', '__pycache__'), recursive = True)

    def tearDown(self):
        for pycache in self.pycaches:
            if os.path.isdir(pycache):
                shutil.rmtree(pycache)

    # 1. Return sum of perimeter
    def test_calculate_perimeter(self):
        square = Square(40)
        self.assertEqual(160, square.calculate_perimeter())
        # 3. Inherit `Shape` class and call `what_am_i` method
        self.assertEqual('I am a shape.', square.what_am_i())

    # 2. Pass a diff and return sum of perimeter
    def test_change_size(self):
        square = Square(80)
        self.assertEqual(280, square.change_size(-10))

    # Insert an object into a list `square_list` and return it
    def test_square_list(self):
        square = Square(120)
        square = Square(160)
        self.assertEqual([40, 80, 120, 160], square.square_list)

if __name__ == '__main__':
    unittest.main()
