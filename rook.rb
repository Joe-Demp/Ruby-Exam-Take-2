require_relative 'piece.rb'

class Rook < Piece
  def to_char
    @colour == :white ? 'R' : 'r'
  end

  def legal_directions
    Directions[0...4]
  end
end
