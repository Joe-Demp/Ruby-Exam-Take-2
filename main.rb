require_relative 'square.rb'
require_relative 'rook.rb'
require_relative 'chess_board.rb'
require_relative 'bishop.rb'
require_relative 'queen.rb'

board = ChessBoard.new

IO.foreach('pieces.txt') do |line|
  type = line[0].to_sym
  col = line[1]
  row = line[2].to_i

  square = Square.new(col, row)
  case type
  when :r, :R
    colour = type == :R ? :white : :black
    piece = Rook.new(square, colour)
  when :b, :B
    colour = type == :B ? :white : :black
    piece = Bishop.new(square, colour)
  when :q, :Q
    colour = type == :Q ? :white : :black
    piece = Queen.new(square, colour)
  else
    piece = nil
  end
  board.add_piece(square, piece) unless piece.nil?
end

# part 1
puts board.to_s
puts

# part 2
board.pieces.each do |piece|
  moves = []
  piece.each_legal_move { |move| moves << move }
  puts "#{piece} #{moves.length}"
end