class Node
  attr_accessor :data, :next_node, :previous_node

  def initialize(options = {})
    @data          = options[:data]
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

class LinkedList
  attr_reader :first

  def initialize(node)
    @first = node
    @last  = node
  end

  def add_node(node)
    @last.next_node    = node
    node.previous_node = @last
    @last              = node
  end

  def delete_node(node)
    node.delete
  end

  def node_at_index(index)
    steps = 1
    node = first
    while node && steps < index
      steps += 1
      node = node.next_node
    end
    node
  end

  def nodes
    array = []
    node = @first
    while node
      array << node
      node = node.next_node
    end
    array
  end

  def partition(i)
    left   = []
    center = []
    right  = []
    nodes.each do |node|
      data = node.data
      if data > i
        right << node
      elsif data < i
        left << node
      else
        center << node
      end
    end
    combined = left + center + right
    combined.each_with_index do |node, index|
      if index == 0
        node.previous_node = nil
        @first = node
      else
        node.previous_node = combined[index - 1]
      end
      if index == combined.size - 1
        node.next_node = nil
        @last = node
      else
        node.next_node = combined[index + 1]
      end
    end
  end

  def print
    p nodes.map { |n| n.data }
  end

  def remove_duplicates
    nodes.each_with_object([]) do |node, array|
      if array.include? node.data
        node.delete
      else
        array << node.data
      end
    end
  end

  def reverse
    @last = first
    node = @last

    while node
      previous = node.next_node

      node.next_node = node.previous_node
      node.previous_node = previous

      if node.previous_node.nil?
        @first = node
      end

      node = node.previous_node
    end
  end
end

class LinkedListFactory
  def self.node_factory
    Node.new data: rand(9)
  end

  def self.linked_list
    ll = LinkedList.new LinkedListFactory.node_factory
    rand(20).times do |i|
      ll.add_node LinkedListFactory.node_factory
    end
    ll
  end
end
