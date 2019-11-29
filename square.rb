class Square
  attr_reader :column, :row

  def initialize(col, row)
    @column = col.is_a?(Integer) ? I_TO_SYMBOL[col] : col.to_sym
    @row = row
  end

  def ==(other)
    if other.is_a?(Square)
      other.column == @column && other.row == @row
    else
      false
    end
  end

  def column_i
    SYMBOL_TO_I[@column]
  end

  SYMBOL_TO_I = {
      :a => 1, :b => 2, :c => 3, :d => 4,
      :e => 5, :f => 6, :g => 7, :h => 8,
  }
  I_TO_SYMBOL = [:a, :b, :c, :d, :e, :f, :g, :h]
end