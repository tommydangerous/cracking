class Node
  attr_accessor :data, :left, :parent, :right

  def initialize(options = {})
    @data  = options[:data]
    @left  = options[:left]
    @right = options[:right]
  end
end
