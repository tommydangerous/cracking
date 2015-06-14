# Implement a function to check if a linked list is a palindrome.

require_relative "linked_list"

ll1 = LinkedListFactory.linked_list
ll2 = LinkedList.new Node.new(data: 1)
[2, 3, 3, 2, 1].each do |i|
  ll2.add_node Node.new(data: i)
end

def palindrome?(linked_list)
  nodes = linked_list.nodes

  data = nodes.map { |n| n.data }
  size = data.size

  left  = []
  right = []

  # Even
  slice = size / 2
  left = data[0...slice]
  if size % 2 == 0
    right = data[slice..-1]
  # Odd
  else
    right = data[slice + 1..-1]
  end

  left == right.reverse
end

p palindrome? ll1
p palindrome? ll2
