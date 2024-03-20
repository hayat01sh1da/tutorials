def list_favourite_musicians(musician1, musician2, musician3):
    musicians = [musician1, musician2, musician3]
    return musicians

def show_geographical_info(country, latitude, longitude):
    country = (country, latitude, longitude)
    return country

def show_self_info(height, occupation, nationality, favourite_colour):
    self_info = {
        'height': height,
        'occupation': occupation,
        'nationality': nationality,
        'favourite_colour': favourite_colour
    }
    return self_info

def get_value():
    self_info = {
        'height': 171,
        'occupation': 'Server-side engineer',
        'nationality': 'Japan',
        'favourite_colour': 'Black'
    }
    key = input('Input a key: ')
    value = self_info[key]
    return value

def show_favourite_tunes(musician, *tunes):
    tunes = {
        musician: tunes
    }
    return tunes
