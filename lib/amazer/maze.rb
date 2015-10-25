class Amazer::Maze

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

  def walkable?(vertex)
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

end
