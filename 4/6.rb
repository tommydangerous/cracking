# Write an algorithm to find the 'next' node (i.e., in-order successor) of a
# given node in a binary search tree. You may assume that each node has a link
# to its parent.

require_relative "binary_search_tree"

tree = BinarySearchTree.new [11, 6, 8, 19, 4, 10, 5, 17, 43, 49, 31]

p tree.preorder.map { |n| n.data }
p tree.inorder.map { |n| n.data }

def next_node_inorder(node)
  traverse_bottom_wall node
end

def traverse_bottom_wall(node, previous_nodes = [])
  previous_nodes << node
  parent = node.parent

  left_node  = node.left
  right_node = node.right

  if parent
    if right_node && !previous_nodes.include?(right_node)
      if right_node.left
        right_node.left
      else
        right_node
      end
    else
      if parent.left && parent.left == node
        parent
      elsif parent.right && parent.right == node
        traverse_bottom_wall parent, previous_nodes
      end
    end
  else
    if right_node && !previous_nodes.include?(right_node)
      if right_node.left
        right_node.left
      elsif right_node.right
        right_node.right
      else
        right_node
      end
    end
  end
end

# does parent exist
  # yes ->
    # does it have a right node && node right isnt in previous
      # yes ->
        # does right node have a left node?
          # yes ->
            # return node.right.left
          # no ->
            # return right node
      # no ->
        # does the parent have a left node and is the left node == node
          # yes ->
            # return parent
        # does the parent have a right node and is the right node == node
          # yes ->
            # repeat on parent
  # no ->
    # does node right exist && right node not in previous
      # yes ->
        # does node.right have a left node?
          # yes ->
            # return node.right.left
        # does node.right have a right node?
          # yes ->
        # else
          # return node.right
      # no ->


tree.inorder.each do |node|
  next_node = next_node_inorder node
  if next_node
    puts "#{node.data} -> #{next_node.data}"
  end
end
