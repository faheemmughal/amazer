require 'amazer/vertex'
require 'amazer/direction'
require 'amazer/maze'
require 'amazer/maze_generator'
require 'amazer/maze_solver'

module Amazer

  def self.run(width = 50, height = 20)
    maze = MazeGenerator.generate(size: { width: width, height: height })
    solution = MazeSolver.solve(maze)

    puts 'Maze'
    puts "Dimensions: #{width} x #{height}"
    puts maze
    puts
    puts 'Solution'
    puts solution
  end

end
