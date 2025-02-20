from shape import Shape

class Rectangle(Shape):
    def __init__(self, v, h):
        self.vertical   = v
        self.horizontal = h

    def calculate_perimeter(self):
        return (self.vertical * 2) + (self.horizontal * 2)
