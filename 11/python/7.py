import random
from sets import Set

def longest_tower(array):
    array_length = len(array)

    sorted_by_height = sorted(array, key=lambda tup: tup[0])

    a1 = longest_increasing_subsequence(sorted_by_height, 1)
    new_subs = set([x for y in a1 for x in y if len(y) > 1])
    new_subs = list(new_subs)
    new_subs.sort(key=lambda tup: tup[1])

    a2 = longest_increasing_subsequence(new_subs, 0)

    return max(a2, key=lambda l: len(l))

def longest_increasing_subsequence(array, compare_index):
    subsequences = [None] * len(array)
    for i in range(0, len(array)):
        if not subsequences[i]:
            subsequences[i] = []

        current = array[i]
        if i == 0:
            subsequences[i].append(current)
        else:
            tail = subsequences[i - 1][-1]
            if current[compare_index] >= tail[compare_index]:
                subsequence = subsequences[i - 1]
                subsequences[i] = subsequence + [current]
            else:
                subsequences[i].append(current)

    return subsequences

people = [
    (58, 192), (62, 160), (68, 97), (71, 106), (72, 93), (78, 140), (78, 189)
]

people = [
    (1, 2),
    (2, 4),
    (7, 5),
    (4, 5),
    (6, 7),
    (6, 8)
]

print longest_tower(people)
