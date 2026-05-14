import is_the_same as i
from rider import Rider


def test_is_the_same():
    rider = Rider('Koichi Oguri', 86)
    oguri_san = rider
    assert i.is_the_same(rider, oguri_san)


def test_is_not_the_same():
    rider = Rider('Koichi Oguri', 86)
    another_rider = Rider('Koichi Oguri', 86)
    assert not i.is_the_same(rider, another_rider)
