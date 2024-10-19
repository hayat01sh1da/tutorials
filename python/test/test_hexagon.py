import unittest
import sys
import glob
import os
import shutil
sys.path.append('./src')
from hexagon import Hexagon

class TestHexagon(unittest.TestCase):
    def setUp(self):
        self.hexagon  = Hexagon(10, 11, 12, 13, 14, 15)
        self.pycaches = glob.glob(os.path.join('.', '**', '__pycache__'), recursive = True)

    def tearDown(self):
        for pycache in self.pycaches:
            if os.path.exists(pycache):
                shutil.rmtree(pycache)

    # Return sum of perimeter
    def test_calculate_perimeter(self):
        self.assertEqual(75, self.hexagon.calculate_perimeter())

if __name__ == '__main__':
    unittest.main()
