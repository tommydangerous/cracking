require_relative "stack"

class Queue
  STACKS = 2

  def initialize
    @current_stack = 0
    @stacks = Array.new(2) { Stack.new }
  end

  def empty?
    @stacks[0].empty? && @stacks[1].empty?
  end

  def pop
    stack = @stacks[@current_stack]
    @current_stack = (@current_stack + 1) % STACKS

    node = nil

    while !stack.empty?
      n = stack.pop
      if @current_stack == 0 && node.nil?
        node = n
      else
        @stacks[@current_stack].push n
      end
    end

    if @current_stack == 1
      node = @stacks[@current_stack].pop
    end

    node
  end

  def push(item)
    @stacks[@current_stack].push item
  end

  def print
    @stacks.each do |stack|
      stack.print
    end
  end
end
