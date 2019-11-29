require 'test/unit'
require_relative 'rook.rb'
require_relative 'square.rb'

class RookTest < Test::Unit::TestCase
  def setup
    sq = Square.new(:d, 8)

    @rook_a = Rook.new(sq, :white)
    @rook_b = Rook.new(nil, :black)
    @rook_c = Rook.new(nil, :red)
    Rook.send(:attr_reader, :colour)
  end

  def teardown
    Rook.send(:undef_method, :colour)
  end

  def test_initialize
    test_square = Square.new(:d, 8)

    assert_equal(test_square, @rook_a.square)
    assert_equal(:white, @rook_a.colour)
  end

  def test_to_char
    assert_equal('R', @rook_a.to_char)
    assert_equal('r', @rook_b.to_char)
    assert_equal('r', @rook_c.to_char)
  end
end