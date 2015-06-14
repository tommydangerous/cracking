# Write code to partition a linked list around a value x,
# such that all nodes less than x come before all nodes
# greater than or equal to x.

require_relative "linked_list"

ll = LinkedListFactory.linked_list

nodes = ll.nodes
node = nodes[nodes.size / 2]

ll.print

p node.data

ll.partition node.data

ll.print
