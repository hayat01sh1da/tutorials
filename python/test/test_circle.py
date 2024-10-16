import unittest
import sys
import glob
import os
import shutil
sys.path.append('./src')
from circle import Circle

class TestCircle(unittest.TestCase):
    def setUp(self):
        self.circle   = Circle(29)
        self.pycaches = glob.glob(os.path.join('.', '**', '__pycache__'))

    def tearDown(self):
        for pycache in self.pycaches:
            if os.path.isdir(pycache):
                shutil.rmtree(pycache)

    # Return pi
    def test_area(self):
        self.assertEqual(2642.079421669016, self.circle.area())

if __name__ == '__main__':
    unittest.main()
