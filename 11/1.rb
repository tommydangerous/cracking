# You are given two sorted arrays, A and B, where A has a large enough buffer
# at the end to hold B. Write a method to merge B into A in sorted order

require_relative "merge_sort"

array1 = [9, 7, 4, 1, 2, 8, 6]
array2 = [10, 23, 62, 5, 3]

def merge_arrays(array1, array2)
  merge_sort array1 + array2
end

p merge_arrays(array1, array2)
