module Amazer
  # A class that takes a maze and tries to solve it using
  # recursive backtracking
  class MazeSolver

    attr_reader :maze,
                :start_vertex,
                :end_vertex,
                :solved_path,
                :visited_path

    def self.solve(maze)
      new(maze: maze).solve
    end

    def initialize(maze:)
      @maze         = maze
      @visited_path = Hash.new(false)
      @solved_path  = Maze.new(width: maze.width, height: maze.height)

      # Assuming we start from (0, 0) and find (width-1, height -1)
      @start_vertex = Vertex.new(0, 0)
      @end_vertex   = Vertex.new(maze.width - 1, maze.height - 1)
    end

    def solve
      solve_recursively(start_vertex)
      solved_path
    end

    def solve_recursively(vertex)
      mark_as_visited(vertex)
      return true if vertex.eql?(end_vertex)

      walkable_directions(vertex).each do |direction|
        next_vertex = vertex.get_vertex(direction)
        next if visited?(next_vertex)

        if solve_recursively(next_vertex)
          mark_as_correct_path(vertex, direction)
          mark_as_correct_path(next_vertex, direction.opposite)
          return true
        end
      end

      false
    end

    def walkable_directions(vertex)
      Direction.walkable_directions_for_value(maze[vertex])
    end

    def mark_as_visited(vertex)
      visited_path[[vertex.x, vertex.y]] = true
    end

    def visited?(vertex)
      visited_path[[vertex.x, vertex.y]]
    end

    def mark_as_correct_path(vertex, direction)
      solved_path[vertex] |= direction.value
    end

  end
end
