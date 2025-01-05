require_relative "board"
require_relative "board_render"
require_relative "pieces/pieces"

class Game
  attr_accessor :turn_count, :player, :turn_count
  def initialize
    @board = Board.start_chess
    @renderer = BoardRender.new(@board)
    @player = :black
    @turn_count = 0
  end

#Game engine
def play_game
  welcome_message
  @renderer.render
  # player_turn until game_over?
  # return unless reset?
  # reset 
  # play_game
  player_turn until turn_count == 10
end

#Turn Engine
def player_turn
  player_move
  next_round
  @renderer.render
end

def welcome_message
  puts "hey-o, welcome to chess!"
end

def player_move
  origin = []
  destination = []

  puts "#{player} pls enter origin: row"
  origin << gets.chomp.to_i
  puts "#{player} pls enter origin: column"
  origin << gets.chomp.to_i
  puts "#{player} pls enter destination: row "
  destination << gets.chomp.to_i
  puts "#{player} pls enter destination: column "
  destination << gets.chomp.to_i

  system('clear') 



  @board.move_piece(origin, destination)
  @turn_count += 1
end


def next_round
  @player == :black ? @player = :white : @player = :black
end

# def game_over?
#   puts "it aint over till its over"
#   check?
#   checkmate?
#   stalemate?
# end

# def reset
#   puts "reset game? y/n"
#   input = gets.chomp
#   return true if input == "y"
#   false
# end

end

