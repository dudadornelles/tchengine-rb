require 'test/unit'
require 'chess/board'
require 'chess/piece'

class TestChessBoard < Test::Unit::TestCase
  def test_new
    board = Chess::Board.new

    assert_equal board[0, 0], Chess::Piece.new(:white, :rook)
    assert_equal board[0, 1], Chess::Piece.new(:white, :knight)
    assert_equal board[4, 4], Chess::Board::EMPTY

    assert_equal board.get('a1'), Chess::Piece.new(:white, :rook)
    assert_equal board.get('c2'), Chess::Piece.new(:white, :pawn)
    assert_equal board.get('d4'), Chess::Board::EMPTY
    assert_equal board.get('g7'), Chess::Piece.new(:black, :pawn)
    assert_equal board.get('c8'), Chess::Piece.new(:black, :bishop)
  end
end
