require_relative "node"

class Stack
  attr_accessor :first

  def initialize(node)
    set_first node
  end

  def first=(node)
    set_first node
  end

  def empty?
    first.nil?
  end

  def min
    @minimum_value
  end

  def nodes
    array = []
    node = first
    while node
      array << node
      node = node.next_node
    end
    array
  end

  def pop
    node = @last
    if first == @last
      @first = nil
      @last  = nil
    else
      @last = node.previous_node
    end
    node.delete
    if node.data == min
      find_minimum_value
    end
    node
  end

  def push(node)
    if node.data < @minimum_value
      @minimum_value = node.data
    end
    @last.next_node    = node
    node.previous_node = @last
    @last              = node
  end

  def print
    p nodes.map { |n| n.data }
  end

  private

  def find_minimum_value
    node = first
    @minimum_value = min + 1
    while node && @minimum_value >= min + 1
      if node.data < @minimum_value
        @minimum_value = node.data
      end
      node = node.next_node
    end
  end

  def set_first(node)
    if first.nil?
      @first = node
      @last  = first
      @minimum_value = first.data
    end
  end
end
