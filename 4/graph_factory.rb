require_relative "graph"
require_relative "graph_node"

class GraphFactory
  def self.graph
    a = GraphNode.new "A"
    b = GraphNode.new "B"
    s = GraphNode.new "S"
    c = GraphNode.new "C"
    d = GraphNode.new "D"
    e = GraphNode.new "E"
    f = GraphNode.new "F"
    g = GraphNode.new "G"
    h = GraphNode.new "H"

    a.add_neighbors [b, s]
    s.add_neighbors [c, g]
    c.add_neighbors [d, e, f]
    e.add_neighbor h
    h.add_neighbor g
    g.add_neighbor f

    # a.print
    # b.print
    # s.print
    # c.print
    # d.print
    # e.print
    # h.print
    # g.print
    # f.print

    graph = Graph.new
    graph.add_vertices [a, b, s, c, d, e, f, g, h]

    graph
  end
end
