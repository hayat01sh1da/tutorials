def print_tv_dramas(movies):
    for movie in movies:
        print(movie)

def print_nums(nums):
    for i in nums:
        print(i)

def print_tv_dramas_with_index(movies):
    for i in range(0, len(movies)):
        movie = movies[i]
        print(f'{i + 1}: {movie}')

def guess_num(val):
    nums = [1, 3, 5, 7, 9]
    while True:
        # val = input('Input a number or \'q\' to quit: ')
        if val == 'q':
            break
        try:
            val = int(val)
        except ValueError:
            print('Input a number or \'q\': ')
        if val in nums:
            print('Congratulations!')
            break
        else:
            print('Try it again!')

def matrix(nums1, nums2):
    result = []
    for num1 in nums1:
        for num2 in nums2:
            result.append(num1 * num2)
    return result
