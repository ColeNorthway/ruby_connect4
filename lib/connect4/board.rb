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
    self.diagonal_win?(player)
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

  # Possible Sloped Up (y<=2 && x<=3 ~ Zero-Based)
  POSSIBLE_UP_DIAGS = [
    [0, 0], [1, 0], [2, 0], [3, 0],
    [0, 1], [1, 1], [2, 1], [3, 1],
    [0, 2], [1, 2], [2, 2], [3, 2],
  ].freeze

  # Possible Sloped Down (y>=3 && x<=3 ~ Zero-Based)
  POSSIBLE_DOWN_DIAGS = [
    [0, 3], [1, 3], [2, 3], [3, 3],
    [0, 4], [1, 4], [2, 4], [3, 4],
    [0, 5], [1, 5], [2, 5], [3, 5],
  ].freeze

  def diagonal_win?(player)
    POSSIBLE_UP_DIAGS.each do |coord|
      if (@grid[coord[0]][coord[1]]         == @grid[coord[0] + 1][coord[1] + 1]) &&
         (@grid[coord[0] + 2][coord[1] + 2] == @grid[coord[0] + 3][coord[1] + 3]) &&
         (@grid[coord[0]][coord[1]]         == @grid[coord[0] + 3][coord[1] + 3]) &&
         (@grid[coord[0]][coord[1]]         == player.char)
        return true
      end
    end

    POSSIBLE_DOWN_DIAGS.each do |coord|
      if (@grid[coord[0]][coord[1]]         == @grid[coord[0] + 1][coord[1] - 1]) &&
         (@grid[coord[0] + 2][coord[1] - 2] == @grid[coord[0] + 3][coord[1] - 3]) &&
         (@grid[coord[0]][coord[1]]         == @grid[coord[0] + 3][coord[1] - 3]) &&
         (@grid[coord[0]][coord[1]]         == player.char)
        return true
      end
    end

    false
  end
end