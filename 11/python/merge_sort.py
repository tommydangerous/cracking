def merge(left_array, right_array):
    results = []
    while left_array and right_array:
        if left_array[0] < right_array[0]:
            results.append(left_array.pop(0))
        else:
            results.append(right_array.pop(0))
    return results + left_array + right_array

def merge_sort(array):
    if len(array) <= 1:
        return array

    middle_index = len(array) / 2

    left_array  = merge_sort(array[:middle_index])
    right_array = merge_sort(array[middle_index:])

    return merge(left_array, right_array)

def test_merge_sort():
    array = [9, 2, 6, 5, 3, 10, 1, 7]
    if merge_sort(array) == sorted(array):
        print "Merge sort test successful"
    else:
        print "Merge sort test failed"

test_merge_sort()
