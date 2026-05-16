import io

import function


def test_cube(monkeypatch):
    monkeypatch.setattr('sys.stdin', io.StringIO('2\n'))
    assert function.cube() == 8


def test_return_str():
    assert function.return_str('Python') == 'Python'


def test_introduce_self():
    assert function.introduce_self('Oasist', 'Python') == \
        'Hi, I am Oasist and stdying Python so hard. My main programming language is Ruby'


def test_calculate():
    assert function.calculate(10) == 20


def test_convert_to_float():
    assert function.convert_to_float('99.99') == 99.99
    assert function.convert_to_float('Hoge') == 'Invalid input.'
