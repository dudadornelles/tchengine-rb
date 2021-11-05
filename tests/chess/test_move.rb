require 'chess/move'
require 'chess/board'
require 'chess/piece'
require 'test/unit'

class TestMove < Test::Unit::TestCase
  include Chess

  def test_pawn_move
    board = Board.new
    assert_equal Move.new(from: [1, 0], to: [2, 0], piece: Piece.new(:white, :pawn), is_capture: false),
                 Move.parse("a3", board, :white)
    assert_equal Move.new(from: [1, 0], to: [3, 0], piece: Piece.new(:white, :pawn), is_capture: false),
                 Move.parse("a4", board, :white)
    assert_equal Move.new(from: [6, 2], to: [4, 2], piece: Piece.new(:black, :pawn), is_capture: false),
                 Move.parse("c5", board, :black)
    assert_equal Move.new(from: [1, 0], to: [2, 1], piece: Piece.new(:white, :pawn), is_capture: true),
                 Move.parse("axb3", board, :white)
  end
end
