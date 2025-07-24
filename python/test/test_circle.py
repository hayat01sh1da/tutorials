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
        self.pycaches = glob.glob(os.path.join('.', '**', '__pycache__'), recursive = True)

    def tearDown(self):
        for pycache in self.pycaches:
            if os.path.exists(pycache):
                shutil.rmtree(pycache)

    # Return pi
    def test_area(self):
        self.assertEqual(self.circle.area(), 2642.079421669016)

if __name__ == '__main__':
    unittest.main()
