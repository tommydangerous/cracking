class Node
  attr_accessor :next_node, :previous_node
  attr_reader :data

  def initialize(options = {})
    @data          = options[:data]
    @next_node     = options[:next_node]
    @previous_node = options[:previous_node]
  end

  def delete
    previous_node.next_node = next_node if previous_node
    next_node.previous_node = previous_node if next_node
  end
end
