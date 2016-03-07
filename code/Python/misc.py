# misc.py
# Miscellaneous Algorithms

import time

def timeit(f):
    def wrapper(*args):
        start = time.time()
        f(*args)
        return time.time() - start
    return wrapper

def is_prime(n):
    if n == 1:
        return False
    if n % 2 == 0:
        return False
    i = 3
    while i * i <= n:
        if n % i == 0:
            return False
        i += 2
    return True


# @timeit
def prime_factors(n):
    prime_factor_list = []
    while not n % 2:
        prime_factor_list.append(2)
        n //= 2
    while not n % 3:
        prime_factor_list.append(3)
        n //= 3
    i = 5
    while n != 1:
        while not n % i:
            prime_factor_list.append(i)
            n //= i
        i += 2

    return prime_factor_list

print(prime_factors(523523))


import itertools

def prime_factors1(n):
    for i in itertools.chain([2], itertools.count(3, 2)):
        if n <= 1:
            break
        while n % i == 0:
            n //= i
            yield i

def is_prime(n):
    if n < 3 or n % 2 == 0:
        return n == 2
    else:
        return not any(n % i == 0 for i in range(3, int(n**0.5 + 2), 2))            
