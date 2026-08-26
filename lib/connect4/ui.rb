# frozen_string_literal: true

require_relative 'board'

# UI is a class that handles printing
#   - It handles all puts and gets
#   - It also can only be called from Controller
class UI
  def player_gen(num)
    puts "Welcome Player#{num}!"

    loop do
      print 'Choose your color: '
      color = gets.chomp.downcase.strip
      if color != 'red' && color != 'blue'
        puts "Error: Invalid Input #{color}"
        next
      end

      print 'What is your name: '
      name = gets.chomp

      return color == 'red' ? ["\u{1F534}", name] : ["\u{1F535}", name]
    end
  end

  def player_coord(player, board)
    loop do
      print "#{player.name} pick a coordinate: "
      coord = gets.chomp.strip

      unless check_coord(coord, board)
        puts 'Error: Invalid Input'
        next
      end

      return coord.split(',').map { |c| c.to_i }
    end
  end

  private

  def check_coord_bounds(coords)
    coords.each_with_index do |c, i|
      begin
        c = c.to_i
      rescue
        return false
      else
        if i == 0
          return false unless (c >= 1 && c <= 7)
        else
          return false unless (c >= 1 && c <= 6)
        end
      end
    end

    true
  end

  def check_coord(coord, board)
    return false if coord.length > 3
    return false if board.coordinates.include?(coord)

    coords = coord.split(',')
    return false if coord.length < 2

    check_coord_bounds(coords)
  end
end
