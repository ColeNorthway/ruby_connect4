# frozen_string_literal: true

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
      puts "{"

      return color == 'red' ? ["\u{1F534}", name] : ["\u{1F535}", name]
    end
  end
end
