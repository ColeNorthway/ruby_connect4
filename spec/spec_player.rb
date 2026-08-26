# frozen_string_literal: true

require_relative '../lib/connect4/player'

RSpec.describe Player do
  describe '#initialize' do
    it 'char accurate' do
      char = "\u{1F534}"
      name = 'bart'
      player = Player.new(char, name)
      expect(player.char).to eql(char)
    end

    it 'name accurate' do
      char = "\u{1F534}"
      name = 'bart'
      player = Player.new(char, name)
      expect(player.name).to eql(name)
    end
  end
end