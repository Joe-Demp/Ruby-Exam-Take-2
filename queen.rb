require_relative 'piece.rb'

class Queen < Piece
  def to_char
    @colour == :white ? 'Q' : 'q'
  end

  def legal_directions
    Directions[0...8]
  end
end