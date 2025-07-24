import unittest
import sys
import glob
import os
import shutil
sys.path.append('./src')
import modu

class TestModu(unittest.TestCase):
    def setUp(self):
        self.pycaches = glob.glob(os.path.join('.', '**', '__pycache__'), recursive = True)

    def tearDown(self):
        for pycache in self.pycaches:
            if os.path.exists(pycache):
                shutil.rmtree(pycache)

    # 1. Return values of Statistics#mthods
    def test_statistics(self):
        data = [100, 200, 300, 400, 500, 500, 600, 700, 800, 900]
        self.assertEqual(modu.calc_fmean(data), 500)
        self.assertEqual(modu.calc_mean(data), 500)
        self.assertEqual(modu.calc_geometric_mean(data), 422.54532757321437)
        self.assertEqual(modu.calc_harmonic_mean(data), 330.1454211974322)
        self.assertEqual(modu.calc_median(data), 500.0)
        self.assertEqual(modu.calc_median_low(data), 500)
        self.assertEqual(modu.calc_median_high(data), 500)
        self.assertEqual(modu.calc_median_grouped(data), 500.0)
        self.assertEqual(modu.calc_mode(data), 500)
        self.assertEqual(modu.calc_multimode(data), [500])
        self.assertEqual(modu.calc_quantiles(data), [275.0, 500.0, 725.0])

    # 2. Define a function in another module which cubes a number and return the value
    def test_import_cubed(self):
        self.assertEqual(modu.import_cubed(9), 729)

if __name__ == '__main__':
    unittest.main()
