require_relative "stack"

class StackSet
  MAX_SIZE = 3

  attr_reader :current_stack_index, :stacks

  def initialize
    @current_stack_index = 0
    @stacks = []
  end

  def current_stack
    stacks[current_stack_index]
  end

  def pop
    node = current_stack.pop
    if current_stack.empty?
      @stacks.delete_at current_stack_index
      @current_stack_index -= 1
    end
    node
  end

  def pop_at(index)
    stack = stacks[index]
    if stack
      node = stack.pop
      @current_stack_index = index
      if stack.empty?
        @stacks.delete_at current_stack_index
        @current_stack_index = stacks.size - 1
      end
      node
    end
  end

  def push(item)
    stack = current_stack
    if stack.nil?
      @stacks[current_stack_index] = Stack.new(item)
    elsif stack_full?
      @current_stack_index += 1
      @stacks << Stack.new(item)
    else
      stack.push item
    end
  end

  def print
    stacks.each do |stack|
      stack.print
    end
  end

  private

  def stack_full?
    current_stack.nodes.size >= 3
  end
end
