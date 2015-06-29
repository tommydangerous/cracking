# Write a function to swap a number in place
# (that is, without temporary variables).

def swap(array, index1, index2):
    array.append(array[index1])
    array[index1] = array[index2]
    array[index2] = array[-1]
    array.pop()

array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
swap(array, 0, 8)
print array
