# frozen_string_literal: true

require_relative '../lib/connect4/controller'
require_relative '../lib/connect4/player'
require_relative '../lib/connect4/UI'

RSpec.describe Controller do
  describe '.init_players' do
    it 'array returned' do
      ui = UI.new
      allow(ui).to receive(:gets).and_return("REd\n", "MCHAmmER\n", "blue", "turnt")

      players = Controller.init_players(ui)
      expect(players).to be_an(Array)
    end

    it 'first item is a player' do
      ui = UI.new
      allow(ui).to receive(:gets).and_return("REd\n", "MCHAmmER\n", "blue", "turnt")

      players = Controller.init_players(ui)
      expect(players[0]).to be_an(Player)
    end

    it 'second item is a player' do
      ui = UI.new
      allow(ui).to receive(:gets).and_return("REd\n", "MCHAmmER\n", "blue", "turnt")

      players = Controller.init_players(ui)
      expect(players[1]).to be_an(Player)
    end
  end
end
