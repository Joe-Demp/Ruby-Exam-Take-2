require 'test/unit'
require_relative 'square.rb'
require_relative 'rook.rb'
require_relative 'chess_board.rb'
require_relative 'piece.rb'

class SquareTest < Test::Unit::TestCase
  def setup
    @square_a = Square.new(:e, 6)
    @square_b = Square.new(5, 6)
    @square_c = Square.new(:e, 6)
    @square_d = Square.new(:b, 2)

    @adjacent_to_square_a = [
        Square.new(:e, 7),
        Square.new(:f, 6),
        Square.new(:e, 5),
        Square.new(:d, 6),
        Square.new(:f, 7),
        Square.new(:f, 5),
        Square.new(:d, 5),
        Square.new(:d, 7)
    ]

    @test_rook = Rook.new(nil, :white)
    @empty_board = ChessBoard.new
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

  def test_adjacent
    Piece::Directions.each_index do |i|
      adj = @square_a.adjacent(Piece::Directions[i])
      assert_equal(@adjacent_to_square_a[i], adj)
    end
  end

  def test_column_i
    assert_equal(5, @square_a.column_i)
    assert_equal(5, @square_b.column_i)
    assert_equal(2, @square_d.column_i)
  end
end
