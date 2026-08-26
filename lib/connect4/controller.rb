# frozen_string_literal: true

require_relative 'player'
require_relative 'ui'
require_relative 'board'


# Controller Module
#   - Handles game start, turns and game end
#   - Loops
#   - All calls to UI
module Controller
  module_function

  def init_players(ui)
    p1_opts = ui.player_gen(1)
    p2_opts = ui.player_gen(2)

    [
      Player.new(p1_opts[0], p1_opts[1]),
      Player.new(p2_opts[0], p2_opts[1])
    ]
  end

  def play
    ui = UI.new
    players = init_players(ui)
  end
end














