import statistics as s
import sys
import cubed as c

# https://docs.python.org/3/library/statistics.html#statistics.mean
def calc_mean(data):
    return s.mean(data)

# https://docs.python.org/3/library/statistics.html#statistics.fmean
def calc_fmean(data):
    return s.fmean(data)

# https://docs.python.org/3/library/statistics.html#statistics.geometric_mean
def calc_geometric_mean(data):
    return s.geometric_mean(data)

# https://docs.python.org/3/library/statistics.html#statistics.harmonic_mean
def calc_harmonic_mean(data):
    return s.harmonic_mean(data)

# https://docs.python.org/3/library/statistics.html#statistics.median
def calc_median(data):
    return s.median(data)

# https://docs.python.org/3/library/statistics.html#statistics.median_low
def calc_median_low(data):
    return s.median_low(data)

# https://docs.python.org/3/library/statistics.html#statistics.median_high
def calc_median_high(data):
    return s.median_high(data)

# https://docs.python.org/3/library/statistics.html#statistics.median_grouped
def calc_median_grouped(data):
    return s.median_grouped(data)

# https://docs.python.org/3/library/statistics.html#statistics.mode
def calc_mode(data):
    return s.mode(data)

# https://docs.python.org/3/library/statistics.html#statistics.multimode
def calc_multimode(data):
    return s.multimode(data)

# https://docs.python.org/3/library/statistics.html#statistics.quantiles
def calc_quantiles(data):
    return s.quantiles(data)

def import_cubed(num):
    return c.calc_num(num)
