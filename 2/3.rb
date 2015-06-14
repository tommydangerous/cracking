# Implement an algorithm to delete a node in the middle of a
# singly linked list, given only access to that node.

require_relative "linked_list"

ll = LinkedListFactory.linked_list

ll.print

nodes = ll.nodes

node = nodes[nodes.size / 2]

p node.data

ll.delete_node node

ll.print
