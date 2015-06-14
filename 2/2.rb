# Implement an algorithm to find the
# kth to last element of a singly linked list/

require_relative "linked_list"

ll = LinkedListFactory.linked_list

ll.print

k = rand(ll.nodes.size)
p k
p ll.node_at_index k
