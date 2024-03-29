require_relative 'piece.rb'

class Bishop < Piece
  def to_char
    @colour == :white ? 'B' : 'b'
  end

  def legal_directions
    Directions[4...8]
  end
end