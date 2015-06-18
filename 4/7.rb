# Design an algorithm and write code to find the first common ancestor of two
# nodes in a binary tree. Avoid storing additional nodes in a data structure.
# NOTE: This is not necessarily a binary search tree.

require_relative "binary_search_tree"

tree = BinarySearchTree.new [11, 6, 8, 19, 4, 10, 5, 17, 43, 49, 31]

p tree.preorder.map { |n| n.data }
p tree.inorder.map { |n| n.data }

def common_ancestor(tree, node1, node2)
  parent1 = node1.parent
  parent2 = node2.parent

  while parent1 && parent2 && parent1 != parent2
    height1 = tree.height_of_node parent1
    height2 = tree.height_of_node parent2

    if height1 < height2
      parent1 = parent1.parent
    elsif height1 > height2
      parent2 = parent2.parent
    else
      parent1 = parent1.parent
      parent2 = parent2.parent
    end
  end

  if parent1 && parent2 && parent1 == parent2
    parent1
  end
end

x = tree.preorder.sample
y = tree.preorder.sample
a = common_ancestor tree, x, y

p [x.data, y.data]
p a.data if a
