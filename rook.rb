class Rook
  attr_accessor :square

  def initialize(square, colour)
    @square, @colour = square, colour
  end

  def to_char
    @colour == :white ? 'R' : 'r'
  end
end
