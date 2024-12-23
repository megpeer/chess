require_relative "lib/board"

# require_relative "lib/game"
# require_relative "lib/pieces"
# require_relative "lib/square"

require_relative "lib/bishop"
require_relative "lib/king"
require_relative "lib/knight"
require_relative "lib/pawn"
require_relative "lib/queen"
require_relative "lib/rook"







# game = Game.new
# game.display_board

b = Board.new
b[[0, 0]] = Pawn.new(:black).to_s
b[[0, 1]] = Pawn.new(:white).to_s
b[[0, 2]] = Bishop.new(:black).to_s
b[[0, 3]] = Bishop.new(:white).to_s

b[[1, 0]] = King.new(:black).to_s
b[[1, 1]] = King.new(:white).to_s
b[[1, 2]] = Queen.new(:black).to_s
b[[1, 3]] = Queen.new(:white).to_s

b[[2, 0]] = Knight.new(:black).to_s
b[[2, 1]] = Knight.new(:white).to_s
b[[2, 2]] = Rook.new(:black).to_s
b[[2, 3]] = Rook.new(:white).to_s


pawnblack = Pawn.new(:black)
puts pawnblack
pawnwhite = Pawn.new(:white)
puts pawnwhite

bishopblack = Bishop.new(:black)
puts bishopblack
bishopwhite = Bishop.new(:white)
puts bishopwhite

kingblack = King.new(:black)
puts kingblack
kingwhite = King.new(:white)
puts kingwhite

queenblack = Queen.new(:black)
puts queenblack
queenwhite = Queen.new(:white)
puts queenwhite

knightblack = Knight.new(:black)
puts knightblack
knightwhite = Knight.new(:white)
puts knightwhite

rookblack = Rook.new(:black)
puts rookblack
rookwhite = Rook.new(:white)
puts rookwhite


b.display_board
