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

  def diagonal_win?(player)
    # Get it working dirty first
    # Iterate the grid for each vert arr
    # For each sub_indx of each vert arr
    #   - Do an ascending if indx <=2 (zero-based)
  end
end