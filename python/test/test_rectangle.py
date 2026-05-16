from rectangle import Rectangle


def test_rectangle():
    rectangle = Rectangle(20, 30)
    assert rectangle.calculate_perimeter() == 100
    assert rectangle.what_am_i() == 'I am a shape.'
