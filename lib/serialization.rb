
require "yaml"

module Serialization
  def load_game
    yaml = YAML.load_file("save_game.yml", permitted_classes: [Symbol, Board, Rook, King, Bishop, Knight, Queen, Pawn])
    @board = yaml[:board]
    @player = yaml[:player]
  end
  def save_game
    variables = { board: @board, player: @player }
    File.write("save_game.yml", variables.to_yaml)
  end

end