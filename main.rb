require_relative "lib/board"
require_relative "lib/game"
require_relative "lib/pieces/pieces"
require_relative "lib/board_render"

# TO DO:
# determine if the game is "won"
# taking turns

b = Board.start_chess
renderer = BoardRender.new(b)
b[[2, 1]] = Pawn.new(b, [2, 2], :white)
# renderer.render
# p b[[1, 2]].available_moves
b.move_piece([1, 0], [2, 0])
renderer.render