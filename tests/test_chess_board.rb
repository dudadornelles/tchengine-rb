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

  def [](column, row)
    @board[row][column]
  end

  def get(position)
    column, row = position.split(//)

    column = "abcdefgh".index(column)
    row = row.to_i - 1

    self[column, row]
  end
end

class TestChessBoard < Test::Unit::TestCase
  def test_new
    board = ChessBoard.new

    assert_equal board[0, 0], WhitePieces::ROOK
    assert_equal board[7, 7], BlackPieces::ROOK

    assert_equal board.get('e4'), ChessBoard::EMPTY_SQUARE
    assert_equal board.get('a1'), WhitePieces::ROOK
    assert_equal board.get('a8'), BlackPieces::ROOK
    assert_equal board.get('d1'), WhitePieces::QUEEN
    assert_equal board.get('f7'), BlackPieces::PAWN
  end
end
