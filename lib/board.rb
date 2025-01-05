
require_relative "pieces/pieces"

class Board
  
  attr_reader :board

  def self.start_chess
    board = self.new
    8.times do |c|
      board[[1, c]] = Pawn.new(board, [1, c], :black)
      board[[6, c]] = Pawn.new(board, [6, c], :white)
    end

    board[[0, 2]] = Bishop.new(board, [0, 2], :black)
    board[[7, 2]] = Bishop.new(board, [7, 2], :white)
    board[[0, 5]] = Bishop.new(board, [0, 5], :black)
    board[[7, 5]] = Bishop.new(board, [7, 5], :white)

    board[[0, 3]] = King.new(board, [0, 3], :black)
    board[[7, 3]] = King.new(board, [7, 3], :white)
    board[[0, 4]] = Queen.new(board, [0, 4], :black)
    board[[7, 4]] = Queen.new(board, [7, 4], :white)

    board[[0, 1]] = Knight.new(board, [0, 1], :black)
    board[[7, 1]] = Knight.new(board, [7, 1], :white)
    board[[0, 6]] = Knight.new(board, [0, 6], :black)
    board[[7, 6]] = Knight.new(board, [7, 6], :white)

    board[[0, 0]] = Rook.new(board, [0, 0], :black)
    board[[7, 0]] = Rook.new(board, [7, 0], :white)
    board[[0, 7]] = Rook.new(board, [0, 7], :black)
    board[[7, 7]] = Rook.new(board, [7, 7], :white)

    board
  end

  def initialize 
    @board = Array.new(8) {Array.new(8)}
  end

  # set
  def []=(location, piece)
    row, column = location
    board[row][column] = piece
  end

  # get
  def [](location)
    row, column = location
    board[row][column]
  end

  def in_bounds?(location)
    row, column = location
    row < board.length &&
    column < board.first.length &&
    row >= 0 &&
    column >= 0
  end

  def empty?(location)
    row, column = location
    board[row][column] == nil
  end

  def move_piece(origin, destination)
    piece = self[origin]
    if !in_bounds?(destination)
      raise "#{destination} not in bounds"
    end
    if !piece.available_moves.include?(destination)
      raise "#{destination} is not available as a legal move. \n for that piece, please choose among #{piece.available_moves}"
    end
    self[origin] = nil
    self[destination] = piece
    piece.location = destination
  end

end


