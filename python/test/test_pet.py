import unittest
import sys
sys.path.append('./src')
from pet import Pet

class TestPet(unittest.TestCase):
    def setUp(self):
        self.pet = Pet('cat', 'nana', 18)

    # Define `Pet` which has 3 attributes
    def test_initialize(self):
        self.assertEqual('cat', self.pet.species)
        self.assertEqual('nana', self.pet.name)
        self.assertEqual(18, self.pet.age)

if __name__ == '__main__':
    unittest.main()
