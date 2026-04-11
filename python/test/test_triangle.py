import unittest
import sys
import glob
import os
import shutil
sys.path.append('./src')
from triangle import Triangle

class TestTriangle(unittest.TestCase):
    def setUp(self) -> None:
        self.triangle = Triangle(100, 30)
        self.pycaches = glob.glob(os.path.join('.', '**', '__pycache__'), recursive = True)

    def tearDown(self) -> None:
        for pycache in self.pycaches:
            if os.path.exists(pycache):
                shutil.rmtree(pycache)

    # Return dimension
    def test_area(self) -> None:
        self.assertEqual(self.triangle.area(), 1500)

if __name__ == '__main__':
    unittest.main()
