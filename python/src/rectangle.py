from shape import Shape

class Rectangle(Shape):
    def __init__(self, v: float, h: float) -> None:
        self.vertical   = v
        self.horizontal = h

    def calculate_perimeter(self) -> float:
        return (self.vertical * 2) + (self.horizontal * 2)
