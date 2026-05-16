from pet import Pet


def test_initialize():
    pet = Pet('cat', 'nana', 18)
    assert pet.species == 'cat'
    assert pet.name == 'nana'
    assert pet.age == 18
