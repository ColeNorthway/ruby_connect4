# frozen_string_literal: true

require_relative '../lib/connect4/controller'
require_relative '../lib/connect4/player'

RSpec.describe Controller do
  describe '.init_players' do
    it 'array returned' do
      players = Controller.init_players()
      expect(players).to be_an(Array)
    end

    it 'first item is a player' do
      players = Controller.init_players()
      expect(players[0]).to be_an(Player)
    end

    it 'second item is a player' do
      players = Controller.init_players()
      expect(players[1]).to be_an(Player)
    end
  end
end
