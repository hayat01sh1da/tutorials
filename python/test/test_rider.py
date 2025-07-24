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
        self.pycaches = glob.glob(os.path.join('.', '**', '__pycache__'), recursive = True)

    def tearDown(self):
        for pycache in self.pycaches:
            if os.path.exists(pycache):
                shutil.rmtree(pycache)

    # Return the attributes of a horse and its rider by composition
    def test_horse(self):
        self.assertEqual(self.rider.name, 'Koichi Oguri')
        self.assertEqual(self.rider.age, 86)

if __name__ == '__main__':
    unittest.main()
