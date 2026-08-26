# frozen_string_literal: true

# Player is a simple class that holds player data
class Player
  attr_reader :char, :name

  def initialize(char, name)
    @char = char
    @name = name
  end
end
