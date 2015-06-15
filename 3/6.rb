# Write a program to sort a stack in ascending order (with biggest items on top
require_relative "stack"

stack  = Stack.new
holder = Stack.new

(1..10).to_a.shuffle.each do |i|
  stack.push Node.new(data: i)
end
stack.print
puts "-" * 20

@tries = 0

def sort_stack_ascending(stack1, stack2)
  @tries += 1

  if stack1.empty?
    return
  end

  if stack2.empty? && stack1.nodes.size == 10
    stack2.push stack1.pop
  end

  if stack1.peek.data <= stack2.peek.data
    stack2.push stack1.pop
  else
    pop_off stack2, stack1.pop
  end

  if stack1.empty?
    until stack2.empty?
      stack1.push stack2.pop
    end
  else
    sort_stack_ascending stack1, stack2
  end
end


def pop_off(stack, incoming_node)
  node = stack.peek
  if node.nil? || incoming_node.data <= node.data
    stack.push incoming_node
  else
    node = stack.pop
    pop_off stack, incoming_node
    stack.push node
  end
end

stack.print
sort_stack_ascending stack, holder
stack.print
