require_relative "stack"

stack_a = Stack.new Node.new(data: 10)
(1..9).each do |i|
  stack_a.push Node.new(data: 10 - i)
end
stack_b = Stack.new
stack_c = Stack.new

@stacks = [stack_a, stack_b, stack_c]

NUMBER_OF_STACKS = 3

@current_stack_index = 0

@source_index = 0

@tries = 0

@minimum_value = 1

def move_node(step)
  @tries += 1
  p "Try: ##{@tries}"
  p "-" * 20

  until (@stacks[0].empty? && @stacks[1].empty?) || @tries >= 5000
    next_index = (@current_stack_index + step) % NUMBER_OF_STACKS
    current_stack = @stacks[@current_stack_index]
    next_stack = @stacks[next_index]

    node = current_stack.peek
    next_node = next_stack.peek

    p "Current stack index: #{@current_stack_index}, Next Index #{next_index}"

    if next_node.nil? || node.data < next_node.data

      if next_node && (next_node.data - node.data) % 2 == 0
        @current_stack_index = (@current_stack_index + 1) % NUMBER_OF_STACKS
        @source_index = @current_stack_index
        move_node 1
      else
        if next_index != @source_index
          @source_index = @current_stack_index
          next_stack.push current_stack.pop

          p "Source index: #{@source_index}"
          # Print
          @stacks.each do |stack|
            stack.print
          end

          if current_stack.empty?
            if @stacks[0].empty?
              @current_stack_index = 1
              @source_index = 1
            else
              @current_stack_index = 0
              @source_index = 0
            end
            move_node 1
          else
            move_node 1
          end
        else
          # Going to a new stack
          @current_stack_index = (@current_stack_index + 1) % NUMBER_OF_STACKS
          @source_index = @current_stack_index
          move_node 1
        end
      end
    elsif next_index == @current_stack_index
      # Going to a new stack
      @current_stack_index = (@current_stack_index + 1) % NUMBER_OF_STACKS
      move_node 1
    else
      step += 1
      move_node step
    end
  end
end

move_node 1
