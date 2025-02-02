require_relative "lib/board"
require_relative "lib/game"
require_relative "lib/pieces/pieces"
require_relative "lib/board_render"

# TO DO:

# 2) include ability to resign with each user prompt. can start with "R to resign?"
#   if gets.chomp is R, then reset game or quit game.
#   
# 3) add ability to save game with each user prompt (re:serialization)
#   if gets.chomp is S, then save game.
# 
# 4) crack open the old RSPEC toolkit and do some tests.

# b = Board.start_chess
# renderer = BoardRender.new(b)
# b[[2, 1]] = Pawn.new(b, [2, 2], :white)
# b.move_piece([1, 0], [2, 0])
# renderer.render

game = Game.new
game.play_game

# test = Board.new
# test[[0, 0]] = King.new(test, [0, 0], :black)
# test[[1, 0]] = Pawn.new(test, [1, 0], :black)
# test[[0, 1]] = Rook.new(test, [0, 1], :black)
# test[[1, 1]] = Bishop.new(test, [1, 1], :black)
# test[[1, 2]] = Knight.new(test, [1, 2], :white)
# testrender = BoardRender.new(test)
# testrender.render

# test.check?(:black)
# test.checkmate_king_move?(:black)
# test.checkmate_capture?(:black)
# test.checkmate_slide_block?(:black)