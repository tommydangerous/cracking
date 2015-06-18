def radix_sort(array)
  base = 10

  passes = Math.log10(array.minmax.map(&:abs).max).to_i + 1

  passes.times.each do |i|
    buckets = Array.new(base * 2) { [] }

    base_i = base**i

    array.each do |n|
      digit = (n / base_i) % base
      buckets[digit] << n
    end

    array = buckets.flatten
  end

  array
end
