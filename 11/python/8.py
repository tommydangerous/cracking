from quick_sort import partition

array = [5, 1, 4, 4, 5, 9, 7, 13, 3]

class StreamInteger:
    def __init__(self, value):
        self.value = value

class Stream:
    def __init__(self, integers):
        self.integers = []
        for i in integers:
            self.track(i)

    def rank(self, integer):
        array = [i.value for i in self.integers]
        index = array.index(integer)
        left, right = partition(array[0:index] + array[index + 1:], integer)
        return len(left)

    def track(self, integer):
        self.integers.append(StreamInteger(integer))

stream = Stream(array)

print [i.value for i in stream.integers]
print stream.rank(1)
print stream.rank(3)
print stream.rank(4)
