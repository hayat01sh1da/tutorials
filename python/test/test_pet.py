import unittest
import sys
import glob
import os
import shutil
sys.path.append('./src')
from pet import Pet

class TestPet(unittest.TestCase):
    def setUp(self):
        self.pet      = Pet('cat', 'nana', 18)
        self.pycaches = glob.glob(os.path.join('.', '**', '__pycache__'), recursive = True)

    def tearDown(self):
        for pycache in self.pycaches:
            if os.path.exists(pycache):
                shutil.rmtree(pycache)

    # Define `Pet` which has 3 attributes
    def test_initialize(self):
        self.assertEqual('cat', self.pet.species)
        self.assertEqual('nana', self.pet.name)
        self.assertEqual(18, self.pet.age)

if __name__ == '__main__':
    unittest.main()
