require_relative "stack_set"

set = StackSet.new

(1..9).each do |i|
  set.push Node.new(data: i)
end

set.print

set.pop_at 1
set.pop_at 1
set.pop_at 1

puts "\n"
set.print

puts "\n"
set.push Node.new(data: 0)
set.print

