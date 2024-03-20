class Triangle:
    def __init__(self, v, h):
        self.vertical = v
        self.horizontal = h

    def area(self):
        return (self.vertical * self.horizontal) / 2
