module Amazer
  # Generate a maze of given dimensions using
  # recursive backtracking algorithm
  class MazeGenerator

    attr_reader :maze,
                :maze_size

    def self.generate(size:)
      new(size: size).generate
    end

    def initialize(size:)
      @maze_size = size
    end

    def generate
      initialize_maze
      pick_starting_vertex
      tunnel_from_starting_vertex

      maze
    end

    def initialize_maze
      @maze = Maze.new(maze_size)
    end

    def pick_starting_vertex
      @starting_vertex = Vertex.new(
        rand(maze.width),
        rand(maze.height)
      )
    end

    def tunnel_from_starting_vertex
      recursive_tunnel @starting_vertex
    end

    def recursive_tunnel(vertex)
      # Pick a random direction at a time and try to tunnel
      Direction.random_directions.each do |direction|
        new_vertex = vertex.get_vertex(direction)
        next unless maze.tunnelable?(new_vertex)

        maze.tunnel_to(vertex, direction)
        maze.tunnel_to(new_vertex, direction.opposite)

        recursive_tunnel(new_vertex)
      end
    end

  end
end
