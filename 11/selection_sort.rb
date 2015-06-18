def selection_sort(array, left_index = 0)
  if left_index < array.size
    smallest = array[left_index]
    index_of_smallest = left_index

    index = left_index + 1

    while index < array.size
      if array[index] < smallest
        smallest = array[index]
        index_of_smallest = index
      end
      index += 1
    end

    swap = array[left_index]
    array[left_index] = smallest
    array[index_of_smallest] = swap

    selection_sort array, left_index + 1
  else
    array
  end
end
