class TreeNode
  attr_accessor :data, :left, :parent, :right

  def initialize(options = {})
    @data   = options[:data]
    @left   = options[:left]
    @parent = options[:parent]
    @right  = options[:right]
  end
end
