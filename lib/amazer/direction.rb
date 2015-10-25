module Amazer
  class Direction

    attr_accessor :name, :value, :x, :y

    def initialize(name, value, x, y)
      @name   = name
      @value  = value
      @x      = x
      @y      = y
    end

    def self.north
      new(:north, 1, 0, -1)
    end

    def self.east
      new(:east, 2, 1, 0)
    end

    def self.west
      new(:west, 4, -1, 0)
    end

    def self.south
      new(:south, 8, 0, 1)
    end

    # Bitwise OR to see if value contains the direction
    def self.has_path_to?(direction, value)
      value & direction.value != 0
    end

    # Return only the directions that are contained in the value
    def self.walkable_directions_for_value(value)
      self.random_directions.select do |direction|
        value & direction.value != 0
      end
    end

    def self.random_directions
      DIRECTIONS.shuffle
    end

    def opposite
      self.class::OPPOSITE_DIRECTIONS[name]
    end


    NORTH = north
    EAST  = east
    WEST  = west
    SOUTH = south

    DIRECTIONS = [
      NORTH,
      EAST,
      SOUTH,
      WEST
    ]

    OPPOSITE_DIRECTIONS = {
      north: SOUTH,
      south: NORTH,
      east:  WEST,
      west:  EAST,
    }
  end
end
