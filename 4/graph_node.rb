class GraphNode
  attr_reader :data

  def initialize(data)
    @data      = data
    @neighbors = []
  end

  def add_neighbor(node)
    add_neighbors [node]
  end

  def add_neighbors(nodes)
    to_add = nodes - neighbors
    to_add.each do |node|
      node.neighbors << self
    end
    @neighbors += to_add
  end

  def neighbors
    if @neighbors.size >= 2
      @neighbors.sort_by { |x| x.data }
    else
      @neighbors
    end
  end

  def print
    p [data, neighbors.map { |n| n.data }]
  end

  def visit
    @visited = true
  end

  def visited?
    @visited
  end
end
