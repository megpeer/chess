require_relative "board"
require_relative "board_render"
require_relative "pieces/pieces"

class Game
  attr_reader :turn_count, :origin, :destination
  def initialize
    @board = Board.start_chess
    @renderer = BoardRender.new(board)
    @origin = []
    @destination = []
    @player = "p1" 
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
  origin_in_bounds?
  destination_in_bounds?
  occupied?
  piece_reader
  place_move
  next_round
  renderer.render
end

def welcome_message
  puts "hey-o, welcome to chess!"
end

def player_move
  puts "#{player} please enter origin coord"
  @origin = gets.chomp
  puts "#{player} please enter destination coord"
  @destination = gets.chomp
end

def origin_in_bounds?
  location = [origin]
  return if board.in_bounds?(location)
  puts "invalid origin, please select again"
  player_move
end

def destination_in_bounds?
  location = [destination]
  return if board.in_bounds?(location)
  puts "invalid destination, please select again"
  player_move
end

def occupied?
  return if board[origin] != "᛫"
  puts "origin coordinates are empty, please select an occupied space"
  # if origin coordinates are not occupied, origin coordinates are invalid.
end

#################### - WORKING - #######################################################
#problem validating player because dont knmwo how to access class info outside of class#
def piece_reader
  player == "p1" ? "black" : "white"
  # determine what is color.
  # if it is not the player's color, it is an invalid move.
end
#################


def place_move
  # if it is the player's color, destination coordinate is validated via the piece class move_dir method.
  # if it is not a valid move according to move_dir, it is an invalid move.
  # if all above checks, the piece is moved to the destination. 
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

