# You are given an array of integers (both positive and negative).
# Find the continuous sequence with the largest sum. Return the sum.

# EXAMPLE
# Input: 2, -8, 3, -2, 4, -10
# Outputs: 5 (i.e., {3, -2, 4})

# current = 2
# output = []
# previous_sums = []
# previous_sums = [2]
# output = [2]

# current = -8
# output = [2]
# previous_sums = [2]
# previous_sums = [-6, -8]
# output = [2, -6, -8]

# current = 3
# output = [2, -6, -8]
# previous_sums = [-6, -8]
# previous_sums = [-3, -5, 3]
# output = [2, -6, -8, -3, -5, 3]

# current = -2
# output = [2, -6, -8, -3, -5, 3]
# previous_sums = [-3, -5, 3]
# previous_sums = [-5, -7, 1, -2]
# output = [2, -6, -8, -3, -5, 3] + [-5, -7, 1, -2]

# current = 4
# output = [2, -6, -8, -3, -5, 3, -5, -7, 1, -2]
# previous_sums = [-5, -7, 1, -2]
# previous_sums = [-1, -3, 5, 2, 4]
# output = [2, -6, -8, -3, -5, 3, -5, -7, 1, -2] + [-1, -3, 5, 2, 4]

# Get current number
# get the previous sums
# add the current number to the previous sums, then append the current number
# add the sums to the output
# repeat

def largest_sum(array):
    output = []
    previous_sums = []
    for n in array:
        previous_sums = [x + n for x in previous_sums]
        previous_sums.append(n)
        output += previous_sums
    return max(output)

print largest_sum([2, -8, 3, -2, 4, -10])
