# func.py

def compose(f, g):
    return lambda x: f(g(x))

foo = compose(lambda x: 2 * x, lambda y: 3 * y)
print(foo(3))


def string_test(s1, s2):
    if not s1 and not s2:
        return True
    elif not s1 or not s2:
        return False
    else:
        return s1[0] == s2[0] and string_test(s1[1:], s2[1:])
