def list_favourite_musicians(musician1: str, musician2: str, musician3: str) -> list[str]:
    musicians = [musician1, musician2, musician3]
    return musicians

def show_geographical_info(country: str, latitude: float, longitude: float) -> tuple[str, float, float]:
    country = (country, latitude, longitude)
    return country

def show_self_info(height: int, occupation: str, nationality: str, favourite_colour: str) -> dict[str, int | str]:
    self_info = {
        'height': height,
        'occupation': occupation,
        'nationality': nationality,
        'favourite_colour': favourite_colour
    }
    return self_info

def get_value() -> int | str:
    self_info = {
        'height': 171,
        'occupation': 'Server-side engineer',
        'nationality': 'Japan',
        'favourite_colour': 'Black'
    }
    key = input('Input a key: ').strip()
    value = self_info[key]
    return value

def show_favourite_tunes(musician: str, *tunes: str) -> dict[str, tuple[str, ...]]:
    tunes = {
        musician: tunes
    }
    return tunes
