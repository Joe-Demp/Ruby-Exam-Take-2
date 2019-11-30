class ChessBoard
  attr_reader :pieces

  def initialize
    @pieces = []
  end

  def square_on_board?(square)
    row, col = square.row, square.column_i
    (1..8).include?(row) && (1..8).include?(col)
  end

  def get_piece(square)
    @pieces.find { |item| item.square == square }
  end

  def add_piece(square, piece)
    return unless square_on_board?(square) && get_piece(square).nil?

    @pieces << piece
    piece.square = square
    piece.board = self
  end

  def to_s
    str = ''
    row = 8
    col = 1

    while row.positive?
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
