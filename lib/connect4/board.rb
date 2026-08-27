# frozen_string_literal: true

require_relative 'player'

# Board represents the game state
#   - Can decide winners
#   - Tracks state as grid
class Board
  attr_reader :coordinates

  def initialize
    @coordinates = []
    @grid = Array.new(7) { Array.new(6) }
  end

  def submit(player, coord)
    @coordinates.push(coord)
    coords = coord.split(',')
    x = coords[0].to_i
    y = coords[1].to_i
    @grid[x - 1][y - 1] = player.char
  end

  def won?(player)
    return true if self.horizontal_win?(player)
    return true if self.vertical_win?(player)
    # Call internal for diagonal
  end

  private

  attr_accessor :grid
  attr_writer :coordinates

  def horizontal_win?(player)
    @grid[0].length.times do |i|
      horiz_arr = @grid.reduce([]) { |h_arr, v_arr| h_arr.push(v_arr[i]) }

      begin
        case horiz_arr
        in [*, ^(player.char), ^(player.char), ^(player.char), ^(player.char), *]
          return true
        end
      rescue NoMatchingPatternError
      end
    end

    false
  end

  def vertical_win?(player)
    @grid.each do |col|
      begin
        case col
        in [*, ^(player.char), ^(player.char), ^(player.char), ^(player.char), *]
          return true
        end
      rescue NoMatchingPatternError
      end
    end


    false
  end

  POSSIBLE_DIAGS = [
    # Sloped Up
    # Sloped Down
  ]

  def diagonal_win?(player)
    # Get it working dirty first
    # Make pregenerated indexes
    #   - Do ascending checks if y<=2 and x<=4(zero-based)
    #   - Do descending checks if y>=3 and x<=4(zero-based)
    #   - Make both of these extra functions
    # The checks work as follows
    #   - check y+1 y+2...
    #   - check x-1 x-2/x+1 x+2...
  end
end