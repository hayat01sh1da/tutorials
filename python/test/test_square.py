from square import Square


def test_calculate_perimeter():
    square = Square(40)
    assert square.calculate_perimeter() == 160
    assert square.what_am_i() == 'I am a shape.'


def test_change_size():
    square = Square(80)
    assert square.change_size(-10) == 280


def test_square_list():
    Square(120)
    square = Square(160)
    assert square.square_list == [40, 80, 120, 160]
