class Stack
  attr_reader :nodes

  def initialize
    @nodes = []
  end

  def empty?
    nodes.empty?
  end

  def pop
    nodes.pop
  end

  def peek
    nodes[-1]
  end

  def push(item)
    nodes << item
  end
end
