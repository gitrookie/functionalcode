def dice():
    l = []
    for x in range(1, 7):
        for y in range(1, 7):
            if x + y == 7:
                l.append((x, y))
    return l
dice()
