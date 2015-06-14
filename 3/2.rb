require "benchmark"

require_relative "stack"

stack = Stack.new Node.new(data: 9)

[3,4,5,6,7,8,2,4,4,6,7].each do |i|
  stack.push Node.new(data: i)
end

stack.print
stack.pop
stack.print
stack.push Node.new(data: 1)
p stack.pop.data

p stack.min

# Benchmark.bm do |x|
#   x.report { stack.pop }
#   x.report { stack.push Node.new(data: 1) }
# end
