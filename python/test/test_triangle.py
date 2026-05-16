from triangle import Triangle


def test_area():
    assert Triangle(100, 30).area() == 1500
