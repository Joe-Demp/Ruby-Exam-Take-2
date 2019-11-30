class Rook < Piece


  def initialize(square, colour)
    @square, @colour = square, colour
    @board = nil
  end

  def to_char
    @colour == :white ? 'R' : 'r'
  end

  def to_s
    to_char + square.to_s
  end

  def legal_directions
    Square::Directions[0...4]
  end

  def each_legal_move
    return nil if @board.nil?

    directions = legal_directions
    directions.each do |dir|
      current_square = @square
      more_moves = true

      begin
        next_square = current_square.adjacent(dir)
        if @board.square_on_board?(next_square)
          next_piece = @board.get_piece(next_square)
          if next_piece.nil?
            yield next_square
          elsif next_piece.colour != @colour
            yield next_square
            more_moves = false
          else  # encountered a piece of self's colour
            more_moves = false
          end
        else
          more_moves = false  # reached edge of board
        end
        current_square = next_square
        end while more_moves
    end
  end
end
