module Amazer
  class Vertex

    attr_accessor :x, :y

    def initialize(x, y)
      @x = x
      @y = y
    end

    def eql?(other_instance)
      (x == other_instance.x) && (y == other_instance.y)
    end

    def get_vertex(direction)
      new_x = x + direction.x
      new_y = y + direction.y

      Vertex.new(
        new_x,
        new_y
        )
    end
  end

end
