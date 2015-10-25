module Amazer
  class Vertex

    attr_accessor :x, :y

    def initialize(x, y)
      @x = x
      @y = y
    end

    def eql?(other)
      (x == other.x) && (y == other.y)
    end

    def get_vertex(direction)
      new_x = x + direction.x
      new_y = y + direction.y

      Vertex.new(new_x, new_y)
    end

  end
end
