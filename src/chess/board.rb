module Chess

  class Board
    EMPTY = :empty

    def initialize
      @board = [
        [Chess::Piece.new(:white, :rook), Chess::Piece.new(:white, :knight), Chess::Piece.new(:white, :bishop), Chess::Piece.new(:white, :queen), Chess::Piece.new(:white, :king), Chess::Piece.new(:white, :bishop), Chess::Piece.new(:white, :knight), Chess::Piece.new(:white, :rook)],
        [Chess::Piece.new(:white, :pawn)] * 8,
        [Chess::Board::EMPTY] * 8,
        [Chess::Board::EMPTY] * 8,
        [Chess::Board::EMPTY] * 8,
        [Chess::Board::EMPTY] * 8,
        [Chess::Piece.new(:black, :pawn)] * 8,
        [Chess::Piece.new(:black, :rook), Chess::Piece.new(:black, :knight), Chess::Piece.new(:black, :bishop), Chess::Piece.new(:black, :queen), Chess::Piece.new(:black, :king), Chess::Piece.new(:black, :bishop), Chess::Piece.new(:black, :knight), Chess::Piece.new(:black, :rook)]
      ]
    end

    def [](row, column)
      @board[row][column]
    end

    def get(position)
      column, row = position.split(//)

      column = "abcdefgh".index(column)
      row = row.to_i - 1

      self[row, column]
    end
  end

end
