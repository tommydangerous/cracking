require_relative "stack_set"

set = StackSet.new

(1..10).each do |i|
  set.push Node.new(data: i)
end

set.print

set.pop
set.pop
set.pop
set.pop
set.push Node.new(data: 7)

set.print
