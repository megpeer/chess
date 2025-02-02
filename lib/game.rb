require_relative "board"
require_relative "board_render"
require_relative "pieces/pieces"
require_relative "serialization"
require "yaml"

class Game
include Serialization

  attr_accessor :board, :player
  def initialize
    @board = Board.start_chess
    @renderer = BoardRender.new(@board)
    @player = :black
  end

#Game engine
def play_game
  @renderer.render
  welcome
  player_turn until game_over?
  next_round
  return unless reset?(player) 
  reset(player)
  play_game
end

#Turn Engine
def player_turn
  player_move
  check?
  next_round
  @renderer.render
end

def welcome
    puts "welcome to my chess game"
    puts "type 'y' to load saved game?"
    start = ""
    start = gets.upcase.chomp
  if start == "Y"
    load_game
  else 
  return
  end
end




def player_move
  origin = 0
  destination = 0
  piece = nil
  origin = [66, 66]
  puts "#{player}'s move"
  ##ORIGIN!
  loop do
    puts "choose origin piece: row, column"
    puts "enter q to quit, s to save."
  input = gets.chomp.downcase
    if input == "q"
      quit
    end
    if input == "s"
      save
    end
    origin = input.split(",").map(&:to_i)
    if !origin.any?(1..7) || origin.length <= 1
      puts "type a valid move."
      player_move
    end
    piece = @board[origin]
    if piece == nil || @board[origin].color != player
      puts "invalid move.please select a space occupied by your piece."
      player_move
    end
    moves = piece.available_moves
    if moves.length < 1
      puts "that piece cant move anywhere! chose another piece!"
      player_move
    end
      puts "the available moves for that piece are #{moves}"
      break
  end
  ##DESTINATION!
  loop do
    puts "choose the destination space: row, column "
    puts "enter q to quit, s to save."
    input = gets.chomp.downcase
    if input == "q"
      quit
    end
    if input == "s"
      save
    end
    destination = input.split(",").map(&:to_i)
    moves = piece.available_moves
      if !moves.include?(destination)
        puts "please select from available moves"
      end
      if moves.include?(destination)
        break
      end
    end

    @board.move_piece(origin, destination)
    system('clear') 
end

def quit
  puts "quittin' time"
  exit!
end

def save 
  puts "saving game ..."
  save_game
  exit!
end

def check?
  @board.check?(player)
end

def next_round
  @player == :black ? @player = :white : @player = :black
end


def game_over?
  return false unless !check?
    @board.checkmate_king_move?(player)
    @board.checkmate_capture?(player)
    @board.checkmate_slide_block?(player)
end

def reset?(player)
  next_round
  puts "wow. #{player} has won this game of chess."
  puts "reset game? y/n"
  input = gets.chomp
  return true if input == "y"
  false
end

end
