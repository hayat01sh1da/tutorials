import unittest
import sys
sys.path.append('./src')
from circle import Circle

class TestCircle(unittest.TestCase):
    def setUp(self):
        self.circle = Circle(29)

    # Return pi
    def test_area(self):
        self.assertEqual(2642.079421669016, self.circle.area())

if __name__ == '__main__':
    unittest.main()
