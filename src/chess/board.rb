require 'chess/utils'

module Chess
  class Board
    include Coordinates

    EMPTY = :empty

    def initialize
      @board = [
        [white(:rook), white(:knight), white(:bishop), white(:queen),
         white(:king), white(:bishop), white(:knight), white(:rook)],
        [white(:pawn)] * 8,
        [Chess::Board::EMPTY] * 8,
        [Chess::Board::EMPTY] * 8,
        [Chess::Board::EMPTY] * 8,
        [Chess::Board::EMPTY] * 8,
        [black(:pawn)] * 8,
        [black(:rook), black(:knight), black(:bishop), black(:queen),
         black(:king), black(:bishop), black(:knight), black(:rook)]
      ]
    end

    def [](row, column)
      @board[row][column]
    end

    def get(position)
      column, row = position.split(//)

      column = col_idx column
      row = row.to_i - 1

      self[row, column]
    end
  end
end

def white(piece)
  Chess::Piece.new(:white, piece)
end

def black(piece)
  Chess::Piece.new(:black, piece)
end
