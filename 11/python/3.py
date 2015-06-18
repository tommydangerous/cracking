def find_element_in_array(element, array):
    index = 0
    found = False

    array_length = len(array)
    while index < array_length - 1 and not found:
        if array[index] == element:
            found = True
        else:
            index = index + 1

    return index

array = [15, 16, 19, 20, 25, 1, 3, 4, 5, 7, 10, 14]

print find_element_in_array(5, array) #=> 8
