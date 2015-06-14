require_relative "bst"

bst = BinarySearchTree.new [11, 6, 8, 19, 4, 10, 5, 17, 43, 49, 31]

def node_height(node)
  if node.nil?
    0
  else
    1 + [node_height(node.left), node_height(node.right)].max
  end
end

def balanced?(node)
  if node.nil?
    true
  else
    left_balanced = balanced? node.left
    right_balanced = balanced? node.right
    diff = (node_height(node.left) - node_height(node.right)).abs
    left_balanced && right_balanced && diff <= 1
  end
end

p balanced? bst.root
