# test.py


def add_sum(n):
    result = []
    for i in range(1, n+1):
        for j in range(1, n+1):
            if i + j == 7:
                result.append((i, j))

    return result

print(add_sum(6))
