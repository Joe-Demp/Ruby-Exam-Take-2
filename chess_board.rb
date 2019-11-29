class ChessBoard

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

  def legal_square?(square)
    row, col = square.row, square.column_i

    @free_squares[row][col]
  end

  def add_piece(square, piece)
    return unless legal_square?(square)

    @pieces << piece
    piece.square = square
    @free_squares[square.row][square.column_i] = false
  end

  def to_s
    str = ''
    row = 8
    col = 1

    while row > 0
      str += row.to_s + ' '
      while col <= 8
        if @free_squares[row][col]
          str += '* '
        else
          piece = @pieces.find do |other|
            other_square = other.square
            puts other.square.inspect
            puts other_square.inspect
            other_square.row == row && other_square.column_i == col
          end
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