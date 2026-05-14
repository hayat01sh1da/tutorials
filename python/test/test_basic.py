import basic


def test_return_three_strings():
    assert basic.return_three_strings('Ruby', 'Python', 'Go lang') == \
        'string1: Ruby, string2: Python, string3: Go lang'


def test_judge_num_1():
    assert basic.judge_num_1(11) == 'Number is 10 or more.'
    assert basic.judge_num_1(10) == 'Number is 10 or more.'
    assert basic.judge_num_1(9) == 'Number is less then 10.'


def test_judge_num_2():
    assert basic.judge_num_2(26) == 'Number is more than 25.'
    assert basic.judge_num_2(25) == 'Number more than 10 and 25 or less.'
    assert basic.judge_num_2(18) == 'Number more than 10 and 25 or less.'
    assert basic.judge_num_2(10) == 'Number is 10 or less.'
    assert basic.judge_num_2(9) == 'Number is 10 or less.'


def test_print_remainder():
    assert basic.print_remainder(29, 3) == 2


def test_judge_age():
    assert basic.judge_age(41) == 'Now you must start paying a healthcare insurace tax.'
    assert basic.judge_age(40) == 'Now you must start paying a healthcare insurace tax.'
    assert basic.judge_age(39) == 'You are legally allowed to drink.'
    assert basic.judge_age(20) == 'You are legally allowed to drink.'
    assert basic.judge_age(19) == 'You are a teen.'
