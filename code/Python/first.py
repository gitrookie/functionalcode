def pascal_triangle(n):
    if n == 1:
        return [1]
    else:
        l = pascal_triangle(n-1)
        length = len(l) - 1
        # return consecutive_sum(pascal_triangle(n-1))
        # return [1] + [l[index]+l[index+1] for index in range(length)] + [1]
        return [1] + [sum(x) for x in zip(l, l[1:])] + [1]


def pascal_triangle_iterative(n):
    pascal_coeff_list = []
    for i in range(1, n+1):
        if i == 1:
            pascal_coeff_list.append(1)
        else:
            pascal_coeff_list = consecutive_sum(pascal_coeff_list)
        display_pascal(pascal_coeff_list, n-(i-1))
    # return pascal_coeff_list


def consecutive_sum(l):
    length = len(l) - 1
    return [1] + [l[index]+l[index+1] for index in range(length)] + [1]


def display_pascal(l, num):
    format_string =  "%{}d".format(num) + " %d" * (len(l) - 1)
    print(format_string % tuple(l))

#print(pascal_triangle(2))
pascal_triangle_iterative(4)
# print(pascal_triangle())


def pascal(n):
   """Prints out n rows of Pascal's triangle.
   It returns False for failure and True for success."""
   row = [1]
   k = [0]
   for x in range(max(n,0)):
      print(row)
      row=[l+r for l,r in zip(row+k,k+row)]
   return n>=1
