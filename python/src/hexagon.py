class Hexagon:
    def __init__(self, s1: float, s2: float, s3: float, s4: float, s5: float, s6: float) -> None:
        self.side1 = s1
        self.side2 = s2
        self.side3 = s3
        self.side4 = s4
        self.side5 = s5
        self.side6 = s6

    def calculate_perimeter(self) -> float:
        sides = [self.side1, self.side2, self.side3, self.side4, self.side5, self.side6]
        return sum(sides)
