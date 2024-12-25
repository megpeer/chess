# require_relative 'board.rb'


class Game
  def initialize
    @board = Board.new
  end



play game
detect state of game (check, checkmate, stalemate)

move
detect if move is valid (from and to)
detect if move is legal (from, to)
detect if pawn is promoted(k, b, r, q)
end

