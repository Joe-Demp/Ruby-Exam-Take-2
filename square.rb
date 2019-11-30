# frozen_string_literal: true

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

  def adjacent(direction)
    row = @row
    col = column_i

    case direction
    when :up then row += 1
    when :neast
      row += 1
      col += 1
    when :right then col += 1
    when :seast
      row -= 1
      col += 1
    when :down then row -= 1
    when :swest
      row -= 1
      col -= 1
    when :left then col -= 1
    when :nwest
      row += 1
      col -= 1
    else
      row = 0
      col = 0
    end

    Square.new(col, row)
  end

  def to_s
    column.to_s + row.to_s
  end

  def column_i
    SYMBOL_TO_I[@column]
  end

  SYMBOL_TO_I = {
    a: 1, b: 2, c: 3, d: 4,
    e: 5, f: 6, g: 7, h: 8
  }.freeze
  I_TO_SYMBOL = [nil, :a, :b, :c, :d, :e, :f, :g, :h].freeze

  Directions = [
      :up, :right, :down, :left,
      :neast, :seast, :swest, :nwest
  ].freeze
end
