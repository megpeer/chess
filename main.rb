require_relative "lib/board"
# require_relative "lib/game"
# require_relative "lib/pieces"
# require_relative "lib/square"



# game = Game.new
# game.display_board
# 
b = Board.new
p b.in_bounds?([0, 0])
p b.in_bounds?([-1, 0])
p b.in_bounds?([3, 1])
p b.in_bounds?([20, 30])