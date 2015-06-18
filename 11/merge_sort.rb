def merge_sort(array)
  return array if array.size <= 1

  middle_index = array.size / 2

  left =  merge_sort array[0...middle_index]
  right = merge_sort array[middle_index..-1]

  merge left, right
end

def merge(left, right)
  results = []
  until left.empty? || right.empty?
    if left.first < right.first
      results << left.shift
    else
      results << right.shift
    end
  end
  results + left + right
end
