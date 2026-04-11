class Triangle:
    def __init__(self, v: float, h: float) -> None:
        self.vertical = v
        self.horizontal = h

    def area(self) -> float:
        return (self.vertical * self.horizontal) / 2
