import statistics as s
import sys
import cubed as c

# https://docs.python.org/3/library/statistics.html#statistics.mean
def calc_mean(data: list[float]) -> float:
    return s.mean(data)

# https://docs.python.org/3/library/statistics.html#statistics.fmean
def calc_fmean(data: list[float]) -> float:
    return s.fmean(data)

# https://docs.python.org/3/library/statistics.html#statistics.geometric_mean
def calc_geometric_mean(data: list[float]) -> float:
    return s.geometric_mean(data)

# https://docs.python.org/3/library/statistics.html#statistics.harmonic_mean
def calc_harmonic_mean(data: list[float]) -> float:
    return s.harmonic_mean(data)

# https://docs.python.org/3/library/statistics.html#statistics.median
def calc_median(data: list[float]) -> float:
    return s.median(data)

# https://docs.python.org/3/library/statistics.html#statistics.median_low
def calc_median_low(data: list[float]) -> float:
    return s.median_low(data)

# https://docs.python.org/3/library/statistics.html#statistics.median_high
def calc_median_high(data: list[float]) -> float:
    return s.median_high(data)

# https://docs.python.org/3/library/statistics.html#statistics.median_grouped
def calc_median_grouped(data: list[float]) -> float:
    return s.median_grouped(data)

# https://docs.python.org/3/library/statistics.html#statistics.mode
def calc_mode(data: list[float]) -> float:
    return s.mode(data)

# https://docs.python.org/3/library/statistics.html#statistics.multimode
def calc_multimode(data: list[float]) -> list[float]:
    return s.multimode(data)

# https://docs.python.org/3/library/statistics.html#statistics.quantiles
def calc_quantiles(data: list[float]) -> list[float]:
    return s.quantiles(data)

def import_cubed(num: float) -> float:
    return c.calc_num(num)
