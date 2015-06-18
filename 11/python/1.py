from merge_sort import merge, merge_sort

import random

def merge_arrays(array1, array2):
    return merge_sort(merge(array1, array2))

array_a = [random.randint(0, 100) for x in range(0, 10)]
array_b = [random.randint(0, 100) for x in range(0, 10)]

print merge_arrays(array_a, array_b)
