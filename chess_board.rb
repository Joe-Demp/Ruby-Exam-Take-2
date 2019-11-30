class ChessBoard
  attr_reader :pieces

  def initialize
    @pieces = []

    @free_squares = []
    (0...10).each do |row|
      @free_squares[row] = []
    end

    # fill with the valid squares
    @free_squares[0].fill(false, 0..9)
    (1..8).each do |row|
      @free_squares[row][0] = false
      @free_squares[row].fill(true, 1..8)
      @free_squares[row][9] = false
    end
    @free_squares[9].fill(false, 0..9)
  end

  def square_on_board?(square)
    row, col = square.row, square.column_i
    (1..8).include?(row) && (1..8).include?(col)
  end

  def get_piece(square)
    piece = @pieces.find { |piece| piece.square == square }
    piece
  end

  def add_piece(square, piece)
    return unless square_on_board?(square) && get_piece(square).nil?

    @pieces << piece
    piece.square = square
    piece.board = self
    @free_squares[square.row][square.column_i] = false
  end

  def to_s
    str = ''
    row = 8
    col = 1

    while row > 0
      str += row.to_s + ' '
      while col <= 8
        piece = get_piece(Square.new(col, row))
        if piece.nil?
          str += '* '
        else
          str += piece.to_char + ' '
        end
        col += 1
      end
      str += "\n"
      row -= 1
      col = 1
    end

    str += '  '
    ('a'..'h').each { |letter| str += letter + ' ' }
    str
  end
end