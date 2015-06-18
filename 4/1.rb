require_relative "binary_search_tree"

tree = BinarySearchTree.new [11, 6, 8, 19, 4, 10, 5, 17, 43, 49, 31]

p tree.balanced?
