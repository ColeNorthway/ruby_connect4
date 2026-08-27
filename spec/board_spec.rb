# frozen_string_literal: true

require_relative '../lib/connect4/board'
require_relative '../lib/connect4/player'

RSpec.describe Board do
  describe '#won?' do
    it 'Four in a row horizontal wins' do
      board = Board.new
      player = Player.new("\u{1F534}", 'rupert')
      board.submit(player, '1,3')
      board.submit(player, '2,3')
      board.submit(player, '3,3')
      board.submit(player, '4,3')
      expect(board.won?(player)).to eql(true)
    end

    it 'Four in a row vertical wins' do
      board = Board.new
      player = Player.new("\u{1F534}", 'rupert')
      board.submit(player, '2,1')
      board.submit(player, '2,2')
      board.submit(player, '2,3')
      board.submit(player, '2,4')
      expect(board.won?(player)).to eql(true)
    end

    it 'Four in a row - forward diagnal wins' do
      board = Board.new
      player = Player.new("\u{1F534}", 'rupert')
      board.submit(player, '1,1')
      board.submit(player, '2,2')
      board.submit(player, '3,3')
      board.submit(player, '4,4')
      expect(board.won?(player)).to eql(true)
    end

    it 'Four in a row - reverse diagnal wins' do
      board = Board.new
      player = Player.new("\u{1F534}", 'rupert')
      board.submit(player, '1,4')
      board.submit(player, '2,3')
      board.submit(player, '3,2')
      board.submit(player, '4,1')
      expect(board.won?(player)).to eql(true)
    end

    it 'None of those win' do
      board = Board.new
      player = Player.new("\u{1F534}", 'rupert')
      board.submit(player, '1,1')
      board.submit(player, '2,2')
      board.submit(player, '3,3')
      board.submit(player, '4,3')
      expect(board.won?(player)).to eql(false)
    end
  end
end

