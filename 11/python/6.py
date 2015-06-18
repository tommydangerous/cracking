from binary_search import binary_search

def find_element_in_matrix(element, matrix):
    matrix_length = len(matrix)

    middle_index = matrix_length / 2
    median = matrix[middle_index]

    if element >= median[0] and element <= median[-1]:
        return binary_search(element, median)
    elif matrix_length <= 1:
        return None
    elif element > median[-1]:
        return find_element_in_matrix(element, matrix[middle_index + 1:])
    elif element < median[0]:
        return find_element_in_matrix(element, matrix[:middle_index])

matrix = []

increment = 10
starting_value = 0
ending_value = 10

for x in range(1, 11):
    matrix.append(range(starting_value, ending_value))
    starting_value = starting_value + increment
    ending_value = ending_value + increment

for row in matrix:
    print " ".join(["{}".format(
            i if i / increment else "0{}".format(i)
        ) for i in row])

print find_element_in_matrix(2, matrix)
