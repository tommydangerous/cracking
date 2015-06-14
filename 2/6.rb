# Given a circular linked list, implement an algorithm which returns the
# node at the beginning of the loop.

require_relative "linked_list"

node = Node.new(data: "A")

ll = LinkedList.new node

%w(B C D E F G H).each do |c|
  ll.add_node Node.new(data: c)
end

nodes = ll.nodes
node1 = nodes[nodes.size / 2]
node2 = nodes.last
node2.next_node = node1

def beginning_of_loop(linked_list)
  seen_data = []

  beginning = false
  node = linked_list.first
  while node && !beginning
    p node.data

    if seen_data.include? node.data
      beginning = true
    else
      seen_data << node.data
      node = node.next_node
    end
  end

  node
end

beginning = beginning_of_loop ll

# p beginning.data
# p beginning.previous_node.data
# p beginning.next_node.data
