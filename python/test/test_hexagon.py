import unittest
import sys
sys.path.append('./src')
from hexagon import Hexagon

class TestHexagon(unittest.TestCase):
    def setUp(self):
        self.hexagon = Hexagon(10, 11, 12, 13, 14, 15)

    # Return sum of perimeter
    def test_calculate_perimeter(self):
        self.assertEqual(75, self.hexagon.calculate_perimeter())

if __name__ == '__main__':
    unittest.main()
