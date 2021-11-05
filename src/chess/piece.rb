module Chess
  class Piece
    attr_reader :color, :name

    def initialize(color, name)
      @color = color
      @name = name
    end

    def ==(other)
      if not other.is_a? Piece
        return false
      end

      @color == other.color && @name == other.name
    end
  end
end
