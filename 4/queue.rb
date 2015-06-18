class Queue
  attr_reader :nodes

  def initialize
    @nodes = []
  end

  def dequeue
    nodes.shift
  end

  def empty?
    nodes.empty?
  end

  def enqueue(item)
    nodes << item
  end
end
