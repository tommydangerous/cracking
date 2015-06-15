# Implement a MyQueue class which implements a queue using two stacks.
require_relative "queue"

q = Queue.new

(1..10).each do |i|
  q.push Node.new(data: i)
end

10.times do
  p q.pop.data
end

q.print
