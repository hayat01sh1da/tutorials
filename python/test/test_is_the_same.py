import unittest
import sys
import glob
import os
import shutil
sys.path.append('./src')
import is_the_same as i
from rider import Rider

class TestIsTheSame(unittest.TestCase):
    def setUp(self):
        self.rider    = Rider('Koichi Oguri', 86)
        self.pycaches = glob.glob(os.path.join('.', '**', '__pycache__'), recursive = True)

    def tearDown(self):
        for pycache in self.pycaches:
            if os.path.exists(pycache):
                shutil.rmtree(pycache)

    # Return True if the 2 objects are the same
    def test_is_the_same(self):
        oguri_san = self.rider
        self.assertTrue(i.is_the_same(self.rider, oguri_san))

    # Return Flase if the 2 objects are not the same
    def test_is_not_the_same(self):
        another_rider = Rider('Koichi Oguri', 86)
        self.assertFalse(i.is_the_same(self.rider, another_rider))

if __name__ == '__main__':
    unittest.main()
