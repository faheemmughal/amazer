module Amazer
  # A class to calculate and resolve direction
  class Direction

    attr_accessor :name, :value, :x, :y

    def initialize(name, value, x, y)
      @name   = name
      # Value is a sequence of bits used to hold multiple values of direction
      @value  = value
      @x      = x
      @y      = y
    end

    def self.north
      # value is 1 which stands for 0001 in bits
      new(:north, 1, 0, -1)
    end

    def self.east
      # value is 2 which stands for 0010 in bits
      new(:east, 2, 1, 0)
    end

    def self.west
      # value is 4 which stands for 0100 in bits
      new(:west, 4, -1, 0)
    end

    def self.south
      # value is 8 which stands for 1000 in bits
      new(:south, 8, 0, 1)
    end

    # Bitwise OR to see if value contains the direction
    def self.path_to?(direction, value)
      value & direction.value != 0
    end

    # Return only the directions that are contained in the value
    def self.walkable_directions_for_value(value)
      random_directions.select do |direction|
        value & direction.value != 0
      end
    end

    def self.random_directions
      DIRECTIONS.shuffle
    end

    def opposite
      self.class::OPPOSITE_DIRECTIONS[name]
    end

    # Initializing objects as constant. Kinda poor replacement for
    # singleton instances but helps in referencing from other parts
    # of code
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
      west:  EAST
    }

  end
end
