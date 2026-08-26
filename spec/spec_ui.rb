# frozen_string_literal: true

require_relative '../lib/connect4/UI'

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
end

