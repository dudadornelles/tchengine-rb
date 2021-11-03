module Chess
  class Piece
    attr_reader :color, :name

    def initialize(color, name)
      @color = color
      @name = name
    end

    def ==(other)
      @color == other.color && @name == other.name
    end
  end
end
