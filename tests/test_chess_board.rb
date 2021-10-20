require 'test/unit'

module WhitePieces
  ROOK = :W_ROOK
  BISHOP = :W_BISHOP
  KNIGHT = :W_KNIGHT
  KING = :W_KING
  QUEEN = :W_QUEEN
  PAWN = :W_PAWN
end

module BlackPieces
  ROOK = :B_ROOK
  BISHOP = :B_BISHOP
  KNIGHT = :B_KNIGHT
  KING = :B_KING
  QUEEN = :B_QUEEN
  PAWN = :B_PAWN
end

class ChessBoard
  EMPTY_SQUARE = 'EMPTY'

  def initialize
    @board = [
      [WhitePieces::ROOK, WhitePieces::KNIGHT, WhitePieces::BISHOP, WhitePieces::QUEEN, WhitePieces::KNIGHT,
       WhitePieces::BISHOP, WhitePieces::KNIGHT, WhitePieces::ROOK],
      [WhitePieces::PAWN] * 8,
      [ChessBoard::EMPTY_SQUARE] * 8,
      [ChessBoard::EMPTY_SQUARE] * 8,
      [ChessBoard::EMPTY_SQUARE] * 8,
      [ChessBoard::EMPTY_SQUARE] * 8,
      [BlackPieces::PAWN] * 8,
      [BlackPieces::ROOK, BlackPieces::KNIGHT, BlackPieces::BISHOP, BlackPieces::QUEEN, BlackPieces::KNIGHT,
       BlackPieces::BISHOP, BlackPieces::KNIGHT, BlackPieces::ROOK]
    ]
  end

  def [](x_ind, y_ind)
    @board[x_ind][y_ind]
  end

  def get(position)
    x, y = position.split(//)

    x = "abcdefgh".index(x)
    y = y.to_i - 1

    self[x, y]
  end
end

class TestChessBoard < Test::Unit::TestCase
  def test_new
    board = ChessBoard.new

    assert_equal board[0, 0], WhitePieces::ROOK
    assert_equal board[7, 7], BlackPieces::ROOK

    assert_equal board.get('e4'), ChessBoard::EMPTY_SQUARE
    assert_equal board.get('g8'), BlackPieces::KNIGHT
  end
end
