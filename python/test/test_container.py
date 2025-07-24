import unittest
import sys
import contextlib
import glob
import os
import shutil
sys.path.append('./src')
import container

class redirect_stdin(contextlib._RedirectStream):
    _stream = 'stdin'

class TesContainer(unittest.TestCase):
    def setUp(self):
        self.pycaches = glob.glob(os.path.join('.', '**', '__pycache__'), recursive = True)

    def tearDown(self):
        for pycache in self.pycaches:
            if os.path.exists(pycache):
                shutil.rmtree(pycache)

    # 1. Return a list including your favourites musicians
    def test_list_favourite_musicians(self):
        self.assertEqual(container.list_favourite_musicians('Oasis', "B'z", "L'Arc~en~Ciel"), ['Oasis', "B'z", "L'Arc~en~Ciel"])

    # 2. Return a taple including a country name, its latitude and longitude you have been to
    def test_show_geographical_info(self):
        self.assertEqual(container.show_geographical_info('Australia', 32.016998, 115.933998), ('Australia', 32.016998, 115.933998))

    # 3. Return a dictionary including keys and values of your features
    def test_show_self_info(self):
        self.assertEqual(
            container.show_self_info(171, 'Server-side engineer', 'Japan', 'Black'),
            {
                'height': 171,
                'occupation': 'Server-side engineer',
                'nationality': 'Japan',
                'favourite_colour': 'Black'
            }
        )

    # 4. Return a value key from a dictionary
    def _calFUT(self):
        return container.get_value()

    def test_get_value(self):
        from io import StringIO
        buf = StringIO()
        buf.write('occupation\n')
        buf.seek(0)

        with redirect_stdin(buf):
            actual = self._calFUT()

        self.assertEqual(actual, 'Server-side engineer')

    # 5. Return a dictionary whose key is musician and value is a tuple oi tunes
    def test_show_favourite_tunes(self):
        self.assertEqual(
            container.show_favourite_tunes(
                'Oasis',
                "Don't Look Back in Anger",
                'Little By Little',
                'Supersonic',
                'Live Forever'
            ),
            {
                'Oasis': (
                    "Don't Look Back in Anger",
                    'Little By Little',
                    'Supersonic',
                    'Live Forever'
                )
            }
        )

if __name__ == '__main__':
    unittest.main()
