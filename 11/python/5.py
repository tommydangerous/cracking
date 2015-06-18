def index_of_string(string, array):
    array_length = len(array)
    middle_index = array_length / 2
    median = array[middle_index]

    while not median:
        middle_index = middle_index + 1
        median = array[middle_index]

    if string == median:
        return middle_index
    elif array_length <= 1:
        return None
    elif string > median:
        return index_of_string(string, array[middle_index + 1:])
    else:
        return index_of_string(string, array[:middle_index])

array = ['at', '', '', '', 'ball', '', '', 'car', '', '', 'dad', '', '']

print index_of_string('ball', array)
