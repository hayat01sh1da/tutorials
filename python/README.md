## 1. Environment

- Python 3.14.6

## 2. Reference

[独学プログラマー Python言語の基本から仕事のやり方まで](https://bookmeter.com/books/12669037)

## 3. Install Libraries via requirements.txt

```command
$ pip install -r requirements.txt
```

## 4. Unit Test

```command
$ pytest .
============================= test session starts ==============================
platform linux -- Python 3.14.6, pytest-9.0.3, pluggy-1.6.0
rootdir: tutorials/python
configfile: pyproject.toml
collected 47 items

test/test_basic.py .....                                                 [ 10%]
test/test_circle.py .                                                    [ 12%]
test/test_container.py .....                                             [ 23%]
test/test_file.py ...                                                    [ 29%]
test/test_function.py .....                                              [ 40%]
test/test_hexagon.py .                                                   [ 42%]
test/test_horse.py .                                                     [ 44%]
test/test_is_the_same.py ..                                              [ 48%]
test/test_loop.py .....                                                  [ 59%]
test/test_modu.py ..                                                     [ 63%]
test/test_pet.py .                                                       [ 65%]
test/test_rectangle.py .                                                 [ 68%]
test/test_rider.py .                                                     [ 70%]
test/test_square.py ...                                                  [ 76%]
test/test_strings.py ..........                                          [ 97%]
test/test_triangle.py .                                                  [100%]

============================== 47 passed in 1.92s ==============================
```

## 5. Static Code Analysis

```command
$ flake8 .
./src/function.py:11:80: E501 line too long (110 > 79 characters)
./test/test_container.py:7:80: E501 line too long (83 > 79 characters)
./test/test_file.py:22:80: E501 line too long (118 > 79 characters)
./test/test_function.py:17:80: E501 line too long (90 > 79 characters)
./test/test_loop.py:8:80: E501 line too long (89 > 79 characters)
./test/test_loop.py:23:80: E501 line too long (82 > 79 characters)
./test/test_loop.py:34:80: E501 line too long (86 > 79 characters)
$ autoflake8 --in-place --remove-duplicate-keys --remove-unused-variables --recursive .
$ autopep8 --in-place --aggressive --aggressive --recursive .
```

## 6. Type Checks

```command
$ mypy .
Success: no issues found in 35 source files
```
