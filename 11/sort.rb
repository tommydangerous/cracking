def merge_sort(array)
  return array if array.length <= 1

  middle = array.size / 2

  left  = merge_sort array[0...middle]
  right = merge_sort array[middle..-1]

  merge(left, right)
end

def merge(left, right)
  result = []
  until left.empty? || right.empty?
    result << (left.first <= right.first ? left.shift : right.shift)
  end
  result + left + right
end

def quick_sort(array)
  return array if array.size <= 1
  pivot = array[0]
  less, greater = array[1..-1].partition { |x| x < pivot }
  quick_sort(less) + [pivot] + quick_sort(greater)
end

def radix_sort(array)
  base = 10

  passes = Math.log10(array.minmax.map(&:abs).max).to_i + 1

  passes.times do |i|
    # 20 buckets
    buckets = Array.new(base * 2) { [] }

    base_i = base**i #=> i = 1, base_i = 10

    array.each do |n|
      digit = (n / base_i) % base
      buckets[digit] << n
      p [i, buckets]
    end

    array = buckets.flatten

    p [i, array]
  end

  array
end

def binary_search(array, number)
  index  = array.size / 2
  median = array[index]

  if array.size == 1
    if array.first == number
      return number
    else
      return
    end
  end

  if number < median
    # Left
    binary_search array[0...index], number
  elsif number > median
    # Right
    binary_search array[index..-1], number
  else
    median
  end
end

ary = [5, 213, 55, 21, 2334, 31, 20, 430]
radix_sort(ary)
