require 'chess/utils'

module Chess
  class Move
    extend Chess::Coordinates

    attr_reader :from, :to, :piece, :is_capture

    def initialize from:, to:, piece:, is_capture: false
      @from = from
      @to = to
      @piece = piece
      @is_capture = is_capture
    end

    def ==(other)
      @from == other.from && @to == other.to && @piece == other.piece && @is_capture == other.is_capture
    end

    def self.parse algebraic_notation_move, board, player
      is_capture = algebraic_notation_move.include? 'x'

      if algebraic_notation_move =~ /^([a-h])(x[a-h])?([1-8])$/ # pawn move
        if is_capture

          from_column = col_idx algebraic_notation_move[0]
          to_column = col_idx algebraic_notation_move[2]
          to_row = algebraic_notation_move[3].to_i - 1
        else
          from_column = col_idx algebraic_notation_move[0]
          to_column = from_column
          to_row = algebraic_notation_move[1].to_i - 1
        end

        # find the pawn
        from_row = to_row + (player == :white ? -1 : 1)
        piece = board[from_row, from_column]
        if piece == Chess::Board::EMPTY
          from_row += (player == :white ? -1 : 1)
          piece = board[from_row, from_column]
          if piece == Chess::Board::EMPTY
            raise ArgumentError, "No #{player} pawn at #{algebraic_notation_move}"
          end
        end

        Move.new from: [from_row, from_column], to: [to_row, to_column], piece: piece, is_capture: is_capture
      end
    end
  end
end
