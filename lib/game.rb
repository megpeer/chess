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
  player_turn until game_over?
  return unless reset?(player) 
  play_game
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
  origin = 0
  destination = 0
  
  puts "#{player}'s move"
  loop do
    puts "pls enter origin: row, column"
    origin = gets.chomp.split(",").map(&:to_i)
      if @board[origin].color != player
        puts "that is not your piece!"
      end
      if  @board[origin].color == player 
        break
      end
  end
    piece = @board[origin]
    moves = piece.available_moves
    puts "the available moves for that piece are #{moves}"
  loop do
    puts "choose the destination: row, column "
    destination = gets.chomp.split(",").map(&:to_i)
      if moves.include?(destination)
        break
      end
  end

    @board.move_piece(origin, destination)
    @turn_count += 1
    system('clear') 
end

def next_round
  @player == :black ? @player = :white : @player = :black
end

def game_over?
  @board.check?(player)
  @board.checkmate_king_move?(player)
  @board.checkmate_capture?(player)
  @board.checkmate_slide_block?(player)
end

def reset?(player)
  puts "wow. #{player} has won this game of chess."
  puts "reset game? y/n"
  input = gets.chomp
  return true if input == "y"
  false
end

end

