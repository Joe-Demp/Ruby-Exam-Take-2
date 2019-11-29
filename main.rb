require_relative 'square.rb'
require_relative 'rook.rb'
require_relative 'chess_board.rb'

board = ChessBoard.new

IO.foreach('pieces.txt') do |line|
  type = line[0]
  col = line[1]
  row = line[2].to_i

  square = Square.new(col, row)
  type = type == 'R' ? :white : :black
  rook = Rook.new(square, type)
  board.add_piece(square, rook)
end

puts board.to_s
