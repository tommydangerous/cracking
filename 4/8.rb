# You have two very large binary trees: Tl, with millions of nodes, and T2,
# with hundreds of nodes.
# Create an algorithm to decide if T2 is a subtree of Tl.

# A tree T2 is a subtree of Tl if there exists a node n in Tl such that the
# subtree of n is identical to T2. That is, if you cut off the tree at node n,
# the two trees would be identical.

require_relative "binary_search_tree"

tree = BinarySearchTree.new [11, 6, 8, 19, 4, 10, 5, 17, 43, 49, 31]

subtree1 = BinarySearchTree.new [6, 8, 4, 10, 5, 1]
subtree2 = BinarySearchTree.new [6, 8, 4, 10, 5]
subtree3 = BinarySearchTree.new [19, 17, 43, 49, 31]

p tree.preorder.map { |n| n.data }
# p subtree1.preorder.map { |n| n.data }
# p subtree2.preorder.map { |n| n.data }
p subtree3.preorder.map { |n| n.data }


def subtree?(tree, larger_tree)
  p tree.root.data
  node = larger_tree.find_node tree.root.data
  larger_tree.cut_tree_at_node node

  larger_tree_nodes = larger_tree.preorder.map { |n| n.data.to_s }.join("")
  tree_nodes = tree.preorder.map { |n| n.data.to_s }.join("")
  larger_tree_nodes == tree_nodes
end

# p subtree? subtree1, tree
# p subtree? subtree2, tree
p subtree? subtree3, tree
