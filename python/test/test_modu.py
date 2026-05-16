import modu


def test_statistics():
    data = [100, 200, 300, 400, 500, 500, 600, 700, 800, 900]
    assert modu.calc_fmean(data) == 500
    assert modu.calc_mean(data) == 500
    assert modu.calc_geometric_mean(data) == 422.54532757321437
    assert modu.calc_harmonic_mean(data) == 330.1454211974322
    assert modu.calc_median(data) == 500.0
    assert modu.calc_median_low(data) == 500
    assert modu.calc_median_high(data) == 500
    assert modu.calc_median_grouped(data) == 500.0
    assert modu.calc_mode(data) == 500
    assert modu.calc_multimode(data) == [500]
    assert modu.calc_quantiles(data) == [275.0, 500.0, 725.0]


def test_import_cubed():
    assert modu.import_cubed(9) == 729
