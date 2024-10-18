import unittest
import sys
import glob
import os
import shutil
sys.path.append('./src')
from rectangle import Rectangle

class TestRectangle(unittest.TestCase):
    def setUp(self):
        self.rectangle = Rectangle(20, 30)
        self.pycaches  = glob.glob(os.path.join('.', '**', '__pycache__'))

    def tearDown(self):
        for pycache in self.pycaches:
            if os.path.isdir(pycache):
                shutil.rmtree(pycache)

    # Return sum of perimeter
    def test_ractangle(self):
        self.assertEqual(100, self.rectangle.calculate_perimeter())
        # 3. Inherit `Shape` class and call `what_am_i` method
        self.assertEqual('I am a shape.', self.rectangle.what_am_i())

if __name__ == '__main__':
    unittest.main()
