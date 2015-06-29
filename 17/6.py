# Given an array of integers, write a method to find indices m and n such that
# if you sorted elements m through n, the entire array would be sorted.

# Minimize n - m (that is, find the smallest such sequence)

# EXAMPLE
# Input: 1, 2, 4, 7, 10, 11, 7, 12, 6, 7, 16, 18, 19
# Output: (3, 9)

def sort_between_indices(array):
    # Find the lowest out of order: 7, then 6
    # Find the highest out of order: 11, then 12
    # (6, 12)
    # start from index 0, and find the earliest place to insert 6
    # start from index -1, and find the earliest place to insert 12
    # sort between those 2 indices

    lowest_out_of_order = None
    highest_out_of_order = None

    for index, number in enumerate(array):
        if index == 0:
            continue

        previous_number = array[index - 1]

        if previous_number > number:
            if not highest_out_of_order or (
                highest_out_of_order and previous_number > highest_out_of_order
                ):
                highest_out_of_order = previous_number

            if not lowest_out_of_order or (
                lowest_out_of_order and number < lowest_out_of_order
                ):
                lowest_out_of_order = number

    lowest_index = None
    highest_index = None

    for index, number in enumerate(array):
        if lowest_index and highest_index:
            break
        if not lowest_index and lowest_out_of_order < number:
            lowest_index = index
        if not highest_index and highest_out_of_order < number:
            highest_index = index

    print (lowest_index, highest_index), array[lowest_index:highest_index]

sort_between_indices([1, 2, 4, 7, 10, 11, 7, 12, 6, 7, 16, 18, 19])
