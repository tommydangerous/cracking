require_relative "matrix"

size = 10

m = Matrix.new size, size

(0...size).each do |i|
  m[i] = Array.new(size) { rand(10) }
end

m.check_zeros

m.print
