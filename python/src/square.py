from shape import Shape

class Square(Shape):
    square_list: list[float] = []

    def __init__(self, s: float) -> None:
        self.side = s
        self.square_list.append(self.side)

    def calculate_perimeter(self) -> float:
        dimension = self.side * 4
        return dimension

    def change_size(self, diff: float) -> float:
        return (self.side + diff) * 4
