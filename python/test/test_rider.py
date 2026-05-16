from rider import Rider


def test_rider():
    rider = Rider('Koichi Oguri', 86)
    assert rider.name == 'Koichi Oguri'
    assert rider.age == 86
