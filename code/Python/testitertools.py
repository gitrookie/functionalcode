# testitertools
# Functionals tools in python

from itertools import *
import operator


def test_accumulate():
    print(accumulate([1,2 , 3, 4], operator.add))
