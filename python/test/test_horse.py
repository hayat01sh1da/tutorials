import unittest
import sys
import glob
import os
import shutil
sys.path.append('./src')
from rider import Rider
from horse import Horse

class TestHorse(unittest.TestCase):
    def setUp(self):
        self.rider    = Rider('Koichi Oguri', 86)
        self.horse    = Horse('Oguri Cap', 25, self.rider)
        self.pycaches = glob.glob(os.path.join('.', '**', '__pycache__'), recursive = True)

    def tearDown(self):
        for pycache in self.pycaches:
            if os.path.exists(pycache):
                shutil.rmtree(pycache)

    # Return the attributes of a horse and its rider by composition
    def test_horse(self):
        self.assertEqual('Oguri Cap', self.horse.name)
        self.assertEqual(25, self.horse.age)
        self.assertEqual(self.horse.rider.name, 'Koichi Oguri')
        self.assertEqual(self.horse.rider.age, 86)

if __name__ == '__main__':
    unittest.main()
