def selection_sort(array):
    pointer = 0
    current_index = 1

    array_length = len(array)
    while pointer < array_length - 1:

        left_item = array[pointer]
        current_item = array[current_index]

        if current_item < left_item:
            array[pointer] = current_item
            array[current_index] = left_item

        if current_index == array_length - 1:
            pointer = pointer + 1
            current_index = pointer + 1
        else:
            current_index = current_index + 1

    return array

def test():
    array = [3, 6, 1, 2, 8, 4, 3, 6, 7, 9, 1, 0]
    if selection_sort(array) == sorted(array):
        print "Selection sort test successful"
    else:
        print "Selection sort test failed"

test()
