import csv

def read_file(file: str) -> str:
    with open(file, 'r') as f:
        return f.read()

def write_file(file: str) -> str:
    val = input('Input something: ').strip()
    with open(file, 'w+') as f:
        f.write(val)
        f.seek(0)
        return f.read()

def write_csv(file: str, data: list[list[str]]) -> str:
    with open(file, 'w+') as f:
        w = csv.writer(f, delimiter=',')
        for datum in data:
            w.writerow(datum)
        f.seek(0)
        return f.read()
