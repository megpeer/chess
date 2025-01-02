require_relative "lib/board"
require_relative "lib/game"
require_relative "lib/pieces/pieces"
# require_relative "lib/pieces/bishop"
# require_relative "lib/pieces/king"
# require_relative "lib/pieces/knight"
# require_relative "lib/pieces/pawn"
# require_relative "lib/pieces/queen"
# require_relative "lib/pieces/rook"

# game = Game.new
# game.play_game

b = Board.new
b[[2, 2]] = King.new(b, [2, 2], :black)
b.display_board
p b[[2, 2]].available_moves