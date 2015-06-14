# Describe how you could use a single array to implement three stack

NUMBER_OF_STACKS = 3
STACK_SIZE = 100

ARRAY    = Array.new(NUMBER_OF_STACKS * STACK_SIZE) { 0 }
POINTERS = [-1, -1, -1]

def push(stack, item)
  stack_number = stack - 1
  POINTERS[stack_number] += 1
  ARRAY[top_of_stack(stack)] = item
end

def pop(stack)
  stack_number = stack - 1
  value = ARRAY[top_of_stack(stack)]
  ARRAY[top_of_stack(stack)] = 0
  POINTERS[stack_number] -= 1
  value
end

def top_of_stack(stack)
  stack_number = stack - 1
  stack_number * STACK_SIZE + POINTERS[stack_number]
end

push 1, "Hello"
push 2, "Yo"
push 3, "Foo"

p pop 1
p pop 2

push 1, "I"
push 1, "am"
push 1, "Tommy"
push 1, "Dang"

p ARRAY
