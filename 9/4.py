# Write a method to return all subsets of aset.

def subsets(array):
    s = []
    if len(array) == 0:
        s.append([])
        return s

    i = array.pop()
    previous_subsets = subsets(array)
    for subs in previous_subsets:
        s.append(subs)
        new_sub = list(subs)
        new_sub.append(i)
        s.append(new_sub)

    return s

array = [1, 2, 3, 4]
print(subsets(array))
