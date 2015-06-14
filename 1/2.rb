def reverse(string)
  array = string.split("")
  reverse_string = []
  index = array.size
  while index > 0
    index -= 1
    reverse_string << array[index]
  end
  reverse_string.join("")
end
