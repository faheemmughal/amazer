module Amazer
  class Maze

    attr_accessor :maze,
                 :height,
                 :width

    def initialize(size)
      @height = size[:height]
      @width  = size[:width]
      @maze = Hash.new(0)
    end

    def [](vertex)
      maze[[vertex.x, vertex.y]]
    end

    def []=(vertex, value)
      maze[[vertex.x, vertex.y]] = value
    end

    def tunnel_to(vertex, direction)
      self[vertex] |= direction.value
    end

    def tunnelable?(vertex)
      inside_maze_width?(vertex) &&
      inside_maze_height?(vertex) &&
      new_vertex?(vertex)
    end

    def inside_maze_width?(vertex)
      vertex.x >= 0 && vertex.x < width
    end

    def inside_maze_height?(vertex)
      vertex.y >= 0 && vertex.y < height
    end

    def new_vertex?(vertex)
      self[vertex] == 0
    end

    def to_s
      output = " " + "_" * (2 * width - 1) + "\n"

      height.times do |y|
        width.times do |x|
          vertex = Vertex.new(x, y)
          output << (Direction.has_path_to?(Direction::SOUTH, self[vertex]) ? " " : "_")

          if Direction.has_path_to?(Direction::EAST, self[vertex])
            if (Direction.has_path_to?(Direction::SOUTH, self[vertex])) # ||
              # Direction.has_path_to?(Direction::SOUTH, self[Vertex.new(x+1, y)]))
              output << " "
            else
              output << "_"
            end
          else
            output <<  "|"
          end
        end
        output << "\n"
      end
      output.chomp("|\n")
    end

  end
end
