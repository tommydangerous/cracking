# Write a method to compute all permutations of a string.

word = "abc"

# 1 - Remove the first letter
# 2 - find all permutations of remaining
# 3 - reinsert the letter that was removed in all places

def perm(word):
    perms = []

    if len(word) == 1:
        return [word]

    first = word[0]
    remaining = word[1:]

    words = perm(remaining)

    for word in words:
        for i in range(0, len(word) + 1):
            s = insert_letter(word, first, i)
            perms.append(s)

    return perms

def insert_letter(word, character, index):
    array = list(word)
    array.insert(index, character)
    return "".join(array)

print sorted(perm(word))
