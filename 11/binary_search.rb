def binary_search(array, number)
  index = array.size / 2
  median = array[index]

  if array.size == 1
    if array.first == number
      return number
    else
      return
    end
  end

  if number > median
    binary_search array[index + 1..-1], number
  elsif number < median
    binary_search array[0...index], number
  else
    median
  end
end
