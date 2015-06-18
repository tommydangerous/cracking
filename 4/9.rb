# You are given a binary tree in which each node contains a value. Design an
# algorithm to print all paths which sum to a given value. The path does not
# need to start or end at the root or a leaf.

require_relative "binary_search_tree"

# tree = BinarySearchTree.new [11, 6, 8, 19, 4, 10, 5, 17, 43, 49, 31]

array = []
10.times.each do
  n = rand(20)
  if rand(2) == 0
    n *= -1
  end
  array << n
end

def path(tree, starting_node, sum, starting_depth)
  successful_paths = []

  paths = {}

  queue = Queue.new
  queue.enqueue starting_node

  until queue.empty?
    node = queue.dequeue
    depth = tree.depth_of_node node

    paths[depth] = {} unless paths[depth]
    paths[depth][node.data] = [] unless paths[depth][node.data]
    paths[depth][node.data] << node.data


    if depth > starting_depth && node.parent
      paths[depth][node.data] = paths[depth - 1][node.parent.data] +
        paths[depth][node.data]
    end

    array = paths[depth][node.data]
    if array.inject { |sum, x| sum + x } == sum
      successful_paths << array
    end

    if node.left
      queue.enqueue node.left
      successful_paths += path(
        tree, node.left, sum, tree.depth_of_node(node.left)
      )
    end
    if node.right
      queue.enqueue node.right
      successful_paths += path(
        tree, node.right, sum, tree.depth_of_node(node.right)
      )
    end
  end

  successful_paths.uniq
end

tree = BinarySearchTree.new array
number = rand(50)
paths = path(tree, tree.root, number, tree.depth_of_node(tree.root))

p tree.preorder.map { |n| n.data }
puts "\n"
p number
puts "\n"
p paths
