# frozen_string_literal: true

require_relative 'player'

class Board
  attr_reader :coordinates

  def initialize
    @coordinates = []
    @grid = Array.new(6) { Array.new(7) }
  end

  def submit(player, coord)
    @coordinates.push(coord)
    coords = coord.split(',')
    x = coords[0].to_i
    y = coords[1].to_i
    @grid[x][y] = player.char
  end

  def won?
    # Call internal for horizontal
    # Call internal for vertical
    # Call internal for diagonal
  end

  private

  attr_accessor :grid
  attr_writer :coordinates

  def horizontal_win?

  end

  def vertical_win?

  end

  def diagonal_win?

  end
end
