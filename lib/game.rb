require_relative 'board.rb'

class Game
  attr_reader :turn_count
  def initialize
    @board = Board.new
    @turn_count = 0
  end

#Game engine
def play_game
  welcome_message
  player_turn until game_over?
  return unless reset?
  reset 
  play_game
end

#Turn Engine
def player_turn
  player_move
  next_round
  display_board
end

def welcome_message
  puts "hey-o, welcome to chess!"
end

def player_move
  (turn_count / 2) == 1 ? player = "p1" : player = "p2"
  puts "#{player} please enter FROM coord"
  from = gets.chomp
  puts "#{player} please enter TO coord"
  to = gets.chomp
  validate_move(from, to)
  place_move(from, to)
end

def validate_move(from, to)
  #from == out of bounds? space not occupied by player colour piece? invalid move. please enter agian.
  #
  #to == out of bounds? space occupied by player colour piece? invalid move. please enter agian.
  #
  #type of piece, check move dirs.
end

def place_move
  # from = to
end

def next_round
  turn_count += 1
end

def game_over?
  puts "it aint over till its over"
  check?
  checkmate?
  stalemate?
end

def reset
  puts "reset game? y/n"
  input = gets.chomp
  return true if input == "y"
  false
end



# move
# detect if move is valid (from and to)
# detect if move is legal (from, to)
# detect if pawn is promoted(k, b, r, q)
end

