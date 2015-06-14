require_relative "node"

class StackNode
  attr_accessor :data, :next_node, :previous_node

  def initialize(options = {})
    @data     = options[:data]
    @next_node     = options[:next_node]
    @previous_node = options[:previous_node]
  end

  def delete
    if previous_node
      previous_node.next_node = next_node
    end
    if next_node
      next_node.previous_node = previous_node
    end
  end
end

class Queue
  attr_reader :first

  def empty?
    first.nil?
  end

  def add(item)
    node = StackNode.new data: item

    if empty?
      @first = node
    end

    if @last
      @last.next_node = node
      @last = node
    else
      @last = node
    end
  end

  def pop
    if @first
      item = @first.data
      @first = @first.next_node
      item
    end
  end
end

class Stack
  def empty?
    @top.nil?
  end

  def pop
    if @top
      item = @top
      @top = @top.next_node
      item
    end
  end

  def push(item)
    t = StackNode.new data: item
    t.next_node = @top
    @top = t
  end

  def peek
    @top.data
  end
end

class BinarySearchTree
  attr_reader :root

  def initialize(array)
    array.each_with_index do |n, index|
      node = Node.new data: n
      if index == 0
        @root = node
      else
        insert_node node
      end
    end
  end

  def level_order_traversal
    nodes = []

    @queue = Queue.new
    @queue.add @root

    while !@queue.empty?
      node = @queue.pop

      if node.left
        @queue.add node.left
      end
      if node.right
        @queue.add node.right
      end

      unless nodes.include? node.data
        nodes << node.data
      end
    end

    nodes
  end

  def non_recursive_traversal
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

  def insert_node(node, parent = @root)
    if parent.data > node.data
      if parent.left
        insert_node node, parent.left
      else
        parent.left = node
        node.parent = parent
      end
    else
      if parent.right
        insert_node node, parent.right
      else
        parent.right = node
        node.parent = parent
      end
    end
  end

  def preorder
    @data = []
    traverse_left_wall root
    @data
  end

  def inorder
    @data = []
    traverse_bottom_wall furthest_left
    @data
  end

  def postorder
    @data = []
    traverse_right_wall furthest_left
    @data
  end

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

  def furthest_left
    left = root
    while left.left
      left = left.left
    end
    left
  end

  def traverse_bottom_wall(node)
    unless @data.include? node.data
      if node.left && !@data.include?(node.left.data)
        traverse_bottom_wall node.left
      else
        @data << node.data
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
    @data << node.data unless @data.include?(node.data)
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

# bst = BinarySearchTree.new [11, 6, 8, 19, 4, 10, 5, 17, 43, 49, 31]

# node = bst.search 11
# bst.delete_node node

# puts bst.preorder

# puts bst.level_order_traversal

