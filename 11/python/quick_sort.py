import random

def quick_sort(array, inplace = True):
    if len(array) <= 1:
        return array

    pivot = array[0]
    left, right = partition(array[1:], pivot)

    return quick_sort(left) + [pivot] + quick_sort(right)

def partition(array, pivot):
    left_pointer = 0
    right_pointer = len(array) - 1

    while left_pointer < right_pointer:
        left_element = array[left_pointer]
        right_element = array[right_pointer]

        if left_element > pivot and right_element < pivot:
            array[left_pointer] = right_element
            array[right_pointer] = left_element
        elif left_element > pivot and right_element == pivot:
            array[left_pointer] = right_element
            array[right_pointer] = left_element
        elif right_element < pivot and left_element == pivot:
            array[left_pointer] = right_element
            array[right_pointer] = left_element
        elif left_element > pivot:
            right_pointer -= 1
        elif right_element < pivot:
            left_pointer += 1
        else:
            left_pointer += 1

    left = []
    right = []
    if left_pointer == 0 and len(array) == 1:
        element = array[left_pointer]
        if element < pivot:
            left.append(element)
        else:
            right.append(element)
    else:
        left = array[:left_pointer]
        right = array[left_pointer:]

    return left, right

def test():
    array = [4, 6, 2, 7, 8, 2, 4, 6, 8, 9, 1, 0]
    if quick_sort(array) == sorted(array):
        print "Success"
    else:
        print "Fail"

test()
