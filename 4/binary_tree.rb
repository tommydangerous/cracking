require_relative "queue"
require_relative "stack"
require_relative "tree_node"

class BinaryTree
  attr_reader :root

  def initialize(data = [])
    data.each do |n|
      insert_node TreeNode.new(data: n)
    end
  end

  def balanced?(node = root)
    if node.nil?
      true
    else
      left_balanced = balanced? node.left
      right_balanced = balanced? node.right

      diff = (height_of_node(node.left) - height_of_node(node.right)).abs

      left_balanced && right_balanced && diff <= 1
    end
  end

  def cut_tree_at_node(node)
    node.parent = nil
    @root       = node
  end

  def delete_node(node)
    if node.left && node.right
      largest_node = largest_node_from_node node.left
      delete_node largest_node

      largest_node.parent = node.parent
      largest_node.left   = node.left
      largest_node.right  = node.right

      if largest_node.left
        largest_node.left.parent = largest_node
      end
      if largest_node.right
        largest_node.right.parent = largest_node
      end

      if node.parent
        if node.parent.left && node.parent.left.data == node.data
          node.parent.left = largest_node
        elsif node.parent.right && node.parent.right.data == node.data
          node.parent.right = largest_node
        end
      end

      if node.data == root.data
        @root = largest_node
      end
    elsif node.left
      node.left.parent = node.parent
      if node.parent.left == node
        node.parent.left = node.left
      elsif node.parent.right == node
        node.parent.right = node.left
      end
    elsif node.right
      node.right.parent = node.parent
      if node.parent.left == node
        node.parent.left = node.right
      elsif node.parent.right == node
        node.parent.right = node.right
      end
    else
      if node.parent.right == node
        node.parent.right = nil
      elsif node.parent.left == node
        node.parent.left = nil
      end
    end
  end

  def depth_of_node(node)
    depth = 0
    node = node.parent
    while node
      depth += 1
      node = node.parent
    end
    depth
  end

  def find_node(data)
    # Using preorder traversal
    found = nil

    left_stack  = Stack.new
    right_stack = Stack.new

    left_stack.push root

    until found || (left_stack.empty? && right_stack.empty?)
      node = left_stack.pop
      if node.nil?
        node = right_stack.pop
      end

      if node.data == data
        found = node
      else
        left_stack.push node.left if node.left
        right_stack.push node.right if node.right
      end
    end

    found
  end

  def height_of_node(node)
    if node.nil?
      0
    elsif node.left || node.right
      1 + [height_of_node(node.left), height_of_node(node.right)].max
    else
      0
    end
  end

  def insert_node(node, parent = root)
    if root.nil?
      @root = node
    elsif insert_node_condition(node, parent)
      insert_left node, parent
    else
      insert_right node, parent
    end
  end

  def inorder
    @data = []
    traverse_bottom_wall furthest_left
    @data
  end

  def preorder
    @data = []
    traverse_left_wall root
    @data
  end

  def postorder
    @data = []
    traverse_right_wall furthest_left
    @data
  end

  def level_order_traversal
    # Breadth first search - children first
    nodes = []

    queue = Queue.new
    queue.enqueue @root

    while !queue.empty?
      node = queue.dequeue

      if node.left
        queue.enqueue node.left
      end
      if node.right
        queue.enqueue node.right
      end

      unless nodes.include? node.data
        nodes << node.data
      end
    end

    nodes
  end

  def non_recursive_traversal
    # Depth first search - adjacent first
    nodes = []

    @stack = Stack.new
    @stack.push @root

    while !@stack.empty?
      node = @stack.peek

      if node.left && !nodes.include?(node.left.data)
        @stack.push node.left
      elsif node.right && !nodes.include?(node.right.data)
        @stack.push node.right
      else
        @stack.pop
      end

      unless nodes.include? node.data
        nodes << node.data
      end
    end

    nodes
  end

  private

  def furthest_left
    left = root
    while left.left
      left = left.left
    end
    left
  end

  def insert_left(node, parent)
    if parent.left
      insert_node node, parent.left
    else
      node.parent = parent
      parent.left = node
    end
  end

  def insert_node_condition(node, parent)
    rand(2) == 0
  end

  def insert_right(node, parent)
    if parent.right
      insert_node node, parent.right
    else
      node.parent  = parent
      parent.right = node
    end
  end

  def largest_node_from_node(node)
    right = node.right
    if right
      while right.right
        right = right.right
      end
      right
    else
      node
    end
  end

  def traverse_bottom_wall(node)
    unless @data.include? node
      if node.left && !@data.include?(node.left)
        traverse_bottom_wall node.left
      else
        @data << node
        if node.right
          traverse_bottom_wall node.right
        end
        if node.parent
          traverse_bottom_wall node.parent
        end
      end
    end
  end

  def traverse_left_wall(node)
    @data << node unless @data.include?(node)
    if node.left
      traverse_left_wall node.left
    end
    if node.right
      traverse_left_wall node.right
    end
  end

  def traverse_right_wall(node)
    unless @data.include? node.data
      if node.left && !@data.include?(node.left.data)
        traverse_right_wall node.left
      else
        if node.right
          traverse_right_wall node.right
        end
        @data << node.data unless @data.include?(node.data)
        if node.parent
          traverse_right_wall node.parent
        end
      end
    end
  end
end
