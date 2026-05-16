from horse import Horse
from rider import Rider
from horse import Horse


def test_horse():
    rider = Rider('Koichi Oguri', 86)
    horse = Horse('Oguri Cap', 25, rider)
    assert horse.name == 'Oguri Cap'
    assert horse.age == 25
    assert horse.rider.name == 'Koichi Oguri'
    assert horse.rider.age == 86
