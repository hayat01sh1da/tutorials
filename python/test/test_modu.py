import unittest
import sys
import glob
import os
import shutil
sys.path.append('./src')
import modu

class TestModu(unittest.TestCase):
    def setUp(self):
        self.pycaches = glob.glob(os.path.join('.', '**', '__pycache__'))

    def tearDown(self):
        for pycache in self.pycaches:
            if os.path.isdir(pycache):
                shutil.rmtree(pycache)

    # 1. Return values of Statistics#mthods
    def test_statistics(self):
        data = [100,200,300,400,500,500,600,700,800,800]
        self.assertEqual(490, modu.calc_mean(data))
        self.assertEqual(490.0, modu.calc_fmean(data))
        self.assertEqual(417.5976552266734, modu.calc_geometric_mean(data))
        self.assertEqual(328.63849765258215, modu.calc_harmonic_mean(data))
        self.assertEqual(500.0, modu.calc_median(data))
        self.assertEqual(500, modu.calc_median_low(data))
        self.assertEqual(500, modu.calc_median_high(data))
        self.assertEqual(500.0, modu.calc_median_grouped(data))
        self.assertEqual(500, modu.calc_mode(data))
        self.assertEqual([500, 800], modu.calc_multimode(data))
        self.assertEqual([275.0, 500.0, 725.0], modu.calc_quantiles(data))

    # 2. Define a function in another module which cubes a number and return the value
    def test_import_cubed(self):
        self.assertEqual(729, modu.import_cubed(9))

if __name__ == '__main__':
    unittest.main()
