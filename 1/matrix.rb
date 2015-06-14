class Matrix < Array
  attr_reader :columns, :rows

  def initialize(rows, columns)
    super
    @rows = rows
    @columns = columns
    initialize_empty_columns
  end

  def check_zeros
    indices = indices_with_zeros
    if indices.size > 0
      rs = []
      cs = []
      indices.each do |pair|
        rs << pair[0]
        cs << pair[1]
      end

      self.each_with_index do |row, row_i|
        row.each_with_index do |column, column_i|
          if rs.include? row_i
            self[row_i] = Array.new(columns) { 0 }
          end
          if cs.include? column_i
            self[row_i][column_i] = 0
          end
        end
      end
    end
  end

  def print
    self.each do |row|
      puts row.map { |i| i ? i.to_s : "--" }.join(" ")
    end
  end

  private

  def indices_with_zeros
    indices = []
    self.each_with_index do |row, row_i|
      row.each_with_index do |column, column_i|
        indices << [row_i, column_i] if column == 0
      end
    end
    indices
  end

  def initialize_empty_columns
    (0..rows-1).each do |i|
      self[i] = Array.new(columns) { nil }
    end
  end
end
