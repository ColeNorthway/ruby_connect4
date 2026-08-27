# frozen_string_literal: true

require_relative '../lib/connect4/ui'
require_relative '../lib/connect4/player'
require_relative '../lib/connect4/board'

RSpec.describe UI do
  describe '#player_gen' do
    it 'string array returned' do
      ui = UI.new
      allow(ui).to receive(:gets).and_return("REd\n", "MCHAmmER\n")

      player_opts = ui.player_gen(1)
      expect(player_opts).to be_an(Array)
    end

    it 'Red returns correct unicode' do
      ui = UI.new
      allow(ui).to receive(:gets).and_return("  REd\n  ", "MCHAmmER\n")

      player_opts = ui.player_gen(1)
      expect(player_opts[0]).to eql("\u{1F534}")
    end

    it 'Blue returns correct unicode' do
      ui = UI.new
      allow(ui).to receive(:gets).and_return("  BluE    \n", "MCHAmmER\n")

      player_opts = ui.player_gen(1)
      expect(player_opts[0]).to eql("\u{1F535}")
    end

    it 'Player name is verbatim' do
      ui = UI.new
      allow(ui).to receive(:gets).and_return("  BluE    \n", "MCHAmmER\n")

      player_opts = ui.player_gen(1)
      expect(player_opts[1]).to eql('MCHAmmER')
    end
  end

  describe '#player_coord' do
    it 'Array returned' do
      player = Player.new("\u{1F534}", 'rupert')
      board = Board.new
      ui = UI.new
      allow(ui).to receive(:gets).and_return("    1    \n")

      res = ui.player_coord(player, board)
      expect(res).to be_an(Array)
    end

    it 'item1 == int' do
      player = Player.new("\u{1F534}", 'rupert')
      board = Board.new
      ui = UI.new
      allow(ui).to receive(:gets).and_return("    1    \n")

      res = ui.player_coord(player, board)
      expect(res[0]).to be_an(Integer)
    end

    it 'item2 == int' do
      player = Player.new("\u{1F534}", 'rupert')
      board = Board.new
      ui = UI.new
      allow(ui).to receive(:gets).and_return("    1    \n")

      res = ui.player_coord(player, board)
      expect(res[1]).to be_an(Integer)
    end
  end
end

