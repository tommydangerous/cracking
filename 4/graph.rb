require_relative "queue"
require_relative "stack"

class Graph
  attr_reader :vertices

  def initialize
    @vertices = []
  end

  def add_vertex(node)
    add_vertices [node]
  end

  def add_vertices(nodes)
    @vertices += nodes - vertices
  end

  def breadth_first_search(starting_node, searching_node = nil)
    output = []
    queue  = Queue.new

    found = starting_node == searching_node if searching_node

    queue.enqueue starting_node
    visit starting_node, output

    while !queue.empty? && !found
      starting_node = queue.dequeue
      starting_node.neighbors.each do |n|
        found = n == searching_node if searching_node

        unless n.visited?
          queue.enqueue n
          visit n, output
        end
      end
    end

    if searching_node
      found ? [searching_node] : nil
    else
      output
    end
  end

  def depth_first_search(starting_node, searching_node = nil)
    output = []
    stack = Stack.new

    dfs starting_node, output, stack, searching_node

    if searching_node.nil?
      output
    else
      output.include? searching_node
    end
  end

  def starting_vertex
    vertices.first
  end

  private

  def dfs(node, output, stack, searching_node = nil)
    return if searching_node && output.include?(searching_node)

    stack.push node
    visit node, output

    node.neighbors.each do |n|
      if n.visited?
        stack.pop
      else
        dfs n, output, stack, searching_node
      end
    end
  end

  def visit(node, output)
    output << node
    node.visit
  end
end
