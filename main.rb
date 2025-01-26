require_relative "lib/board"
require_relative "lib/game"
require_relative "lib/pieces/pieces"
require_relative "lib/board_render"

# TO DO:


# 1) determine if the game is "won"
#         
#   > check-mate
#       can player get out of CHECK?
#         player can move out of CHECK by validating:
#         - are any of player king's moves list is not included in all enemey pieces's move
#          list? (king can move itself out of check)
#         - for all enemy checking pices, are their locations included in current player 
#         pieces moves list? (can checking piece be captured?)
#         - for all enemy checking pieces except knights, are any diagonal or orthoganal 
#         squares in between the player's king and checking piece included in any of 
#         player's pieces moves list? (can the check be blocked by another piece?)
#   
#       GAME OVER if player cannot get out of CHECK; above items return false
#         
#   > stalemate/resign
#         -every user prompt can start with "R to resign?"
#           if gets.chomp is R, then reset game or quit game.
#   
# 2) add support for special moves
#   > KING: castling
#   > PAWN: en-passant pawn capturing
#   > PAWN: promotion
# 
# 3) add ability to save game at any time (re:serialization)
# 
# 4) crack open the old RSPEC toolkit and do some tests.
# 
# 5) refine error handling to not break out of the game cycle.


# b = Board.start_chess
# renderer = BoardRender.new(b)
# b[[2, 1]] = Pawn.new(b, [2, 2], :white)
# b.move_piece([1, 0], [2, 0])
# renderer.render

# game = Game.new
# game.play_game
# 
test = Board.new
test[[0, 0]] = King.new(test, [0, 0], :black)
test[[1, 1]] = Queen.new(test, [1, 1], :white)

test[[3, 2]] = Knight.new(test, [3, 2], :white)
# test[[7, 3]] = King.new(test, [7, 3], :white)
testrender = BoardRender.new(test)
testrender.render

# p test[[2, 2]].available_moves
test.check?(:black)
 test.check_mate?(:black)