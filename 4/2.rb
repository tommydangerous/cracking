# Given a directed graph, design an algorithm to find out
# whether there is a route between two nodes.

require_relative "graph_factory"

graph = GraphFactory.graph

# p graph.breadth_first_search(graph.starting_vertex).map { |n| n.data }
# => ["A", "B", "S", "C", "G", "D", "E", "F", "H"]

p graph.depth_first_search(graph.starting_vertex).map { |n| n.data }
# => ["A", "B", "S", "C", "D", "E", "H", "G", "F"]

def route?(graph, node)
  graph.depth_first_search(graph.starting_vertex, node)
end

node = GraphNode.new("Z")
# node = graph.vertices.sample

p route?(graph, node)
