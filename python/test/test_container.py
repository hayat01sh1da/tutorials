import io

import container


def test_list_favourite_musicians():
    assert container.list_favourite_musicians('Oasis', "B'z", "L'Arc~en~Ciel") == \
        ['Oasis', "B'z", "L'Arc~en~Ciel"]


def test_show_geographical_info():
    assert container.show_geographical_info('Australia', 32.016998, 115.933998) == \
        ('Australia', 32.016998, 115.933998)


def test_show_self_info():
    assert container.show_self_info(171, 'Server-side engineer', 'Japan', 'Black') == {
        'height': 171,
        'occupation': 'Server-side engineer',
        'nationality': 'Japan',
        'favourite_colour': 'Black',
    }


def test_get_value(monkeypatch):
    monkeypatch.setattr('sys.stdin', io.StringIO('occupation\n'))
    assert container.get_value() == 'Server-side engineer'


def test_show_favourite_tunes():
    assert container.show_favourite_tunes(
        'Oasis',
        "Don't Look Back in Anger",
        'Little By Little',
        'Supersonic',
        'Live Forever',
    ) == {
        'Oasis': (
            "Don't Look Back in Anger",
            'Little By Little',
            'Supersonic',
            'Live Forever',
        ),
    }
