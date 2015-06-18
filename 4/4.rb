# Given a binary tree, design an algorithm which creates a linked list of all
# the nodes at each depth (e.g., if you have a tree with depth D,
# you'll have D linked lists).

require_relative "../3/node"
require_relative "3"

def create_linked_lists_based_on_depth(tree)
  tree.preorder.each_with_object({}) do |node, hash|
    depth = tree.depth_of_node node

    node = Node.new(data: node)
    if hash[depth]
      hash[depth].next_node = node
      node.previous_node = hash[depth]
    end
    hash[depth] = node
  end
end

array = [1, 2, 3, 4, 5, 6]
tree = create_tree_with_minimum_height array

p tree.preorder.map { |n| n.data }

create_linked_lists_based_on_depth(tree).values.each do |node|
  output = []

  n = node
  while n
    output << n.data
    n = n.previous_node
  end

  p output.map { |x| x.data }
end
