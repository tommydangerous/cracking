require_relative "binary_tree"

class BinarySearchTree < BinaryTree
  def search(item, node = @root)
    if node
      if item == node.data
        node
      elsif item < node.data
        search item, node.left
      else
        search item, node.right
      end
    end
  end

  private

  def insert_node_condition(node, parent)
    parent.data > node.data
  end
end
