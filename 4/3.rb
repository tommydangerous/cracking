# Given a sorted (increasing order) array with unique integer elements,
# write an algorithm to create a binary search tree with minimal height.

require_relative "binary_search_tree"

# tree = BinarySearchTree.new [11, 6, 8, 19, 4, 10, 5, 17, 43, 49, 31]

# p tree.preorder

def insert_nodes(tree, array)
  unless array.empty?
    index  = array.size / 2
    median = array[index]

    tree.insert_node TreeNode.new(data: median)

    left  = array[0...index]
    right = array[index + 1..-1]

    insert_nodes tree, left
    insert_nodes tree, right
  end
end

def create_tree_with_minimum_height(array)
  tree = BinarySearchTree.new

  insert_nodes tree, array

  tree
end

array = [1, 2, 3, 4, 5, 6]
t = create_tree_with_minimum_height array

# p t.preorder.map { |n| n.data }
# p t.height_of_node t.preorder.first
