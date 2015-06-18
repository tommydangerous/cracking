def binary_search(element, array):
    array_length = len(array)
    middle_index = array_length / 2
    median = array[middle_index]

    if element == median:
        return median
    elif array_length <= 1:
        return None
    elif element > median:
        return binary_search(element, array[middle_index + 1:])
    else:
        return binary_search(element, array[:middle_index])

def test():
    array = range(1, 10)
    if binary_search(5, array) == 5 and binary_search(100, array) == None:
        print "Binary search test successful"
    else:
        print "Binary search test failed"

test()
