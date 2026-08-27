# frozen_string_literal: true

require_relative 'board'

# UI is a class that handles printing
#   - It handles all puts and gets
#   - It also can only be called from Controller
class UI
  def player_gen(num)
    puts "Welcome Player#{num}!"

    loop do
      print 'Choose your color (red/blue): '
      color = gets.chomp.downcase.strip
      if color != 'red' && color != 'blue'
        puts "Error: Invalid Input #{color}"
        next
      end

      print 'What is your name: '
      name = gets.chomp

      # return color == 'red' ? ["\u{1F534}", name] : ["\u{1F535}", name]
      return color == 'red' ? ["\e[31m\u25CF\e[0m", name] : ["\e[34m\u25CF\e[0m", name]
    end
  end

  def player_coord(player, board)
    loop do
      print "#{player.name} pick an coordinate: "
      coord = gets.chomp.strip

      unless check_coord(coord, board)
        puts 'Error: Invalid Input'
        next
      end

      return [coord.to_i, board.get_y(coord.to_i)]
    end
  end

  def game_draw
    puts "The game is a draw..."
  end

  def game_won(player)
    puts "#{player.name} won!"
  end

  def print_board(board)
    board_str = <<~BOARD
      ┌───┬───┬───┬───┬───┬───┬───┐
      │ #{board.grid[0][5]} │ #{board.grid[1][5]} │ #{board.grid[2][5]} │ #{board.grid[3][5]} │ #{board.grid[4][5]} │ #{board.grid[5][5]} │ #{board.grid[6][5]} │
      ├───┼───┼───┼───┼───┼───┼───┤
      │ #{board.grid[0][4]} │ #{board.grid[1][4]} │ #{board.grid[2][4]} │ #{board.grid[3][4]} │ #{board.grid[4][4]} │ #{board.grid[5][4]} │ #{board.grid[6][4]} │
      ├───┼───┼───┼───┼───┼───┼───┤
      │ #{board.grid[0][3]} │ #{board.grid[1][3]} │ #{board.grid[2][3]} │ #{board.grid[3][3]} │ #{board.grid[4][3]} │ #{board.grid[5][3]} │ #{board.grid[6][3]} │
      ├───┼───┼───┼───┼───┼───┼───┤
      │ #{board.grid[0][2]} │ #{board.grid[1][2]} │ #{board.grid[2][2]} │ #{board.grid[3][2]} │ #{board.grid[4][2]} │ #{board.grid[5][2]} │ #{board.grid[6][2]} │
      ├───┼───┼───┼───┼───┼───┼───┤
      │ #{board.grid[0][1]} │ #{board.grid[1][1]} │ #{board.grid[2][1]} │ #{board.grid[3][1]} │ #{board.grid[4][1]} │ #{board.grid[5][1]} │ #{board.grid[6][1]} │
      ├───┼───┼───┼───┼───┼───┼───┤
      │ #{board.grid[0][0]} │ #{board.grid[1][0]} │ #{board.grid[2][0]} │ #{board.grid[3][0]} │ #{board.grid[4][0]} │ #{board.grid[5][0]} │ #{board.grid[6][0]} │
      └───┴───┴───┴───┴───┴───┴───┘
        1   2   3   4   5   6   7
    BOARD
    puts board_str
  end

  private

  def check_coord_bounds(coord)
    return false if coord > 7 || coord.negative?
    true
  end

  def check_coord(coord, board)
    return false if coord.length > 1
    return false if board.coordinates.count(coord) == 6
    return false if coord.to_i.zero?

    check_coord_bounds(coord.to_i)
  end
end
