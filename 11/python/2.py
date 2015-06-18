from selection_sort import selection_sort

words = ["aa", "art", "army", "tommy", "mary", "rat", "jim", "tar"]

def sort_anagrams(words):
    words = ["".join(selection_sort(list(word))) for word in words]
    return selection_sort(words)

print sort_anagrams(words)
