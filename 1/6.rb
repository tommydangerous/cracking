class Pixel
  attr_accessor :x, :y

  def initialize(options = {})
    @data = options[:data]
    @x    = options[:x]
    @y    = options[:y]
  end

  def data
    (@data / 10) == 0 ? "0#{@data}" : @data.to_s
  end
end

class Image
  attr_reader :matrix

  def initialize(rows)
    @rows   = rows
    @matrix = []
    rows.times.each_with_object([]) do |row_i, array|
      row = (0..rows - 1).map do |col_i|
        Pixel.new(data: col_i + 1, x: row_i, y: col_i)
      end
      matrix << row
    end
  end

  def print
    matrix.each do |row|
      puts row.map { |p| p ? p.data : "--" }.join(" ")
    end
  end

  def rotate
    row_size = @rows
    new_matrix = Array.new(row_size) { Array.new(row_size) { 0 } }

    matrix.each_with_index do |row, row_index|
      row.each_with_index do |column, column_index|
        coord = new_coordinate row_index, column_index

        new_matrix[coord[0]][coord[1]] = column
      end
    end

    @matrix = new_matrix
  end

  def rotate_in_place
    matrix.each do |row|
      row.each do |pixel|
        rotate_pixel pixel
      end
    end
  end

  private

  def new_coordinate(x, y)
    new_x = y
    new_y = (@rows - 1) - x
    [new_x, new_y]
  end

  def rotate_pixel(pixel)
    if pixel
      matrix[pixel.x][pixel.y] = nil
      coord = new_coordinate(pixel.x, pixel.y)

      next_pixel = matrix[coord[0]][coord[1]]

      matrix[coord[0]][coord[1]] = pixel

      rotate_pixel next_pixel
    end
  end
end

image = Image.new 10

image.print

image.rotate
# image.rotate_in_place

puts "\n"
image.print

# width = 4

# [0, 0] -> [0, 3]
# [0, 1] -> [1, 3]
# [0, 2] -> [2, 3]
# [0, 3] -> [3, 3]

# new_row = old_column
# new_column = (length - 1) - old_row

# [1, 0] -> [0, 2]
# [1, 1] -> [1, 2]
# [1, 2] -> [2, 2]
# [1, 3] -> [3, 2]

# new_row = old_column
# new_column = (length - 1) - old_row

# [2, 0] -> [0, 1]
# [2, 1] -> [1, 1]
# [2, 2] -> [2, 1]
# [2, 3] -> [3, 1]

# new_row = old_column
# new_column = (length - 1) - old_row

# [3, 0] -> [0, 0]
# [3, 1] -> [1, 0]
# [3, 2] -> [2, 0]
# [3, 3] -> [3, 0]

# new_row = old_column
# new_column = (length - 1) - old_row
