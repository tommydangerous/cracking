# Implement a function to check if a binary tree is a binary search tree

require_relative "binary_search_tree"

def children_test

end

def binary_search_tree?(tree)
  queue = Queue.new
  queue.enqueue tree.root

  is_binary_search_tree = true

  until queue.empty?
    node = queue.dequeue

    queue.enqueue(node.left) if node.left
    queue.enqueue(node.right) if node.right

    if node.left && node.left.data > node.data
      return false
    end
    if node.right && node.right.data < node.data
      return false
    end
  end

  is_binary_search_tree
end

def test
  array = (1..15).to_a.shuffle

  binary_tree = BinaryTree.new array
  binary_search_tree = BinarySearchTree.new array

  if binary_search_tree?(binary_tree) == false &&
    binary_search_tree?(binary_search_tree) == true
    puts "Success"
  else
    puts "Fail"
  end
end

test
