from hexagon import Hexagon


def test_calculate_perimeter():
    assert Hexagon(10, 11, 12, 13, 14, 15).calculate_perimeter() == 75
