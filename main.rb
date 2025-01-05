require_relative "lib/board"
require_relative "lib/game"
require_relative "lib/pieces/pieces"
require_relative "lib/board_render"

# TO DO:
# 1) refine player_move. constrain moves to:
#   > player limited to only moving THEIR colour
#   > can only input number 0 to 7
#   
# 2) add support for special moves
#   > KING: castling
#   > PAWN: en-passant pawn capturing
#   > PAWN: promotion
# 
# 2) determine if the game is "won"
#   > check
#   > check-mate
#   > stalemate
#   > resign
#   
# 3) should be able to save game at any time (revisit serialization)
# 
# 4) crack open the old RSPEC toolkit and do some tests.


# b = Board.start_chess
# renderer = BoardRender.new(b)
# b[[2, 1]] = Pawn.new(b, [2, 2], :white)
# b.move_piece([1, 0], [2, 0])
# renderer.render

game = Game.new
game.play_game