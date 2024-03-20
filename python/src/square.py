from shape import Shape

class Square(Shape):
    square_list = []

    def __init__(self, s):
        self.side = s
        self.square_list.append(self.side)

    def calculate_perimeter(self):
        dimension = self.side * 4
        return dimension

    def change_size(self, diff):
        return (self.side + diff) * 4
