require 'test/unit'
require_relative 'square.rb'

class SquareTest < Test::Unit::TestCase
  def setup
    @square_a = Square.new(:e, 6)
    @square_b = Square.new(5, 6)
    @square_c = Square.new(:e, 6)

    @square_d = Square.new(:b, 2)
  end

  def test_initialize
    assert_equal(:e, @square_b.column)
    assert_equal(6, @square_b.row)

    assert_equal(:b, @square_d.column)
    assert_equal(2, @square_d.row)
  end

  def test_equality
    assert(@square_a == @square_c)
    assert(@square_a == @square_b)

    assert_false(@square_c == @square_d)
  end

  def test_column_i
    assert_equal(5, @square_a.column_i)
    assert_equal(5, @square_b.column_i)
    assert_equal(2, @square_d.column_i)
  end
end