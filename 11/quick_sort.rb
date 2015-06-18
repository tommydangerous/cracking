def partition(array, pivot)
  less    = []
  greater = []
  array.each do |n|
    if n >= pivot
      greater << n
    else
      less << n
    end
  end
  [less, greater]
end

def quick_sort(array)
  return array if array.size <= 1
  pivot = array[0]

  # less, greater = array[1..-1].partition { |n| n < pivot }

  partitions = partition array[1..-1], pivot
  less = partitions[0]
  greater = partitions[1]

  quick_sort(less) + [pivot] + quick_sort(greater)
end
