import io

import file


def test_read_file():
    assert file.read_file('./file/read_file.txt') == 'Hogehoge\nFoobar\n'


def test_write_file(monkeypatch):
    monkeypatch.setattr('sys.stdin', io.StringIO('Foobar\n'))
    assert file.write_file('./file/write_file.txt') == 'Foobar'


def test_write_csv():
    data = [
        ['Top Gun', 'Risky Business', 'Minority Report'],
        ['Titanic', 'The Revenant', 'Interception'],
        ['Training Day', 'Man on Fire', 'Flight'],
    ]
    assert file.write_csv('./file/write_file.csv', data) == \
        'Top Gun,Risky Business,Minority Report\nTitanic,The Revenant,Interception\nTraining Day,Man on Fire,Flight\n'
