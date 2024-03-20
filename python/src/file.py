import csv

def read_file(file):
    with open(file, 'r') as f:
        return f.read()

def write_file(file):
    val = input('Input something: ')
    with open(file, 'w+') as f:
        f.write(val)
        f.seek(0)
        return f.read()

def write_csv(file, data):
    with open(file, 'w+') as f:
        w = csv.writer(f, delimiter=',')
        for datum in data:
            w.writerow(datum)
        f.seek(0)
        return f.read()
