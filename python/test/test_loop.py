import loop


def test_print_tv_dramas(capsys):
    loop.print_tv_dramas(['The Walking Dead', 'Entourage', 'The Sopranos', 'Vampire Diaries'])
    captured = capsys.readouterr()
    assert captured.out == 'The Walking Dead\nEntourage\nThe Sopranos\nVampire Diaries\n'


def test_print_nums(capsys):
    loop.print_nums(range(1, 11))
    captured = capsys.readouterr()
    assert captured.out == '1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n'


def test_print_tv_dramas_with_index(capsys):
    loop.print_tv_dramas_with_index(
        ['The Walking Dead', 'Entourage', 'The Sopranos', 'Vampire Diaries'],
    )
    captured = capsys.readouterr()
    assert captured.out == \
        '1: The Walking Dead\n2: Entourage\n3: The Sopranos\n4: Vampire Diaries\n'


def test_guess_num(capsys):
    loop.guess_num(1)
    captured = capsys.readouterr()
    assert captured.out == 'Congratulations!\n'


def test_matrix():
    assert loop.matrix([8, 19, 148, 4], [9, 1, 33, 83]) == \
        [72, 8, 264, 664, 171, 19, 627, 1577, 1332, 148, 4884, 12284, 36, 4, 132, 332]
