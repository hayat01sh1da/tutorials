import unittest
import sys
import glob
import os
import shutil
sys.path.append('./src')
from rider import Rider

class TestRider(unittest.TestCase):
    def setUp(self):
        self.rider    = Rider('Koichi Oguri', 86)
        self.pycaches = glob.glob(os.path.join('.', '**', '__pycache__'))

    def tearDown(self):
        for pycache in self.pycaches:
            if os.path.isdir(pycache):
                shutil.rmtree(pycache)

    # Return the attributes of a horse and its rider by composition
    def test_horse(self):
        self.assertEqual('Koichi Oguri', self.rider.name)
        self.assertEqual(86, self.rider.age)

if __name__ == '__main__':
    unittest.main()
