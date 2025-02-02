
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

  def check?(color)
    pieces.select {|piece| piece.color != color}.each do |piece|
      if piece.available_moves.include?(king_pos(color))
          puts "#{color} king at position #{king_pos(color)} is in check"
        return true
      else false
      end
    end
  end
 
  def checkmate_king_move?(color)
      #CHECK IF ANY KING MOVES ARE POSSIBLE TO ESCAPE ENEMY MOVE LIST
    king_moves = self[king_pos(color)].available_moves.flatten
    enemy_moves = []
    mate_moves = []  
    pieces.select {|piece| piece.color != color}.each do |piece|
      enemy_moves << piece.available_moves
    end
    mate_moves = king_moves.reject{ |k| enemy_moves.flatten.include? k }
    if mate_moves.empty?
      return true
    else false
    end
    p "kings only safe moves out of check are #{mate_moves}"
  end
    
  def checkmate_capture?(color)
    checking_pieces = []
    #CHECK IF ANY ENEMY CHECKING PIECES CAN BE CAPTURED BY PLAYER PIECES
    pieces.select {|piece| piece.color != color}.each do |piece|
      if piece.available_moves.include?(king_pos(color))
        checking_pieces << piece.location
      end
    end

    pieces.select {|piece| piece.color == color}.each do |piece|
      if piece.available_moves.include?(checking_pieces.flatten)
        puts "a checking piece can be captured at #{checking_pieces.flatten}"
      end
    end
  end

  def king_pos(color)
    pieces.find {|p| p.color == color && p.is_a?(King)}.location
  end

  def pieces
    board.flatten.compact!
  end

  def checkmate_slide_block?(color)
    checking_pieces = []
    sliding_pieces = []
    sliding_locs = []
    pieces.select {|piece| piece.color != color}.each do |piece|
      if piece.available_moves.include?(king_pos(color))
        checking_pieces << piece
      end
    end
    # IF CHECKING PIECES CAN SLIDE, CAN ANY PLAYER PIECE BLOCK THE PATH?
    checking_pieces.each do |piece|
      if piece.is_a?(Bishop) || piece.is_a?(Queen) || piece.is_a?(Rook)
        sliding_pieces << piece
      end
    end
    sliding_pieces.each do |piece|
      sliding_locs << piece.location
    end
    connect_check(sliding_locs, color)
  end

  def connect_check(sliding_locs, color)
    heap = []
    direction = [0, 0]
    dist = [0, 0]
    king_pos = king_pos(color)

    sliding_locs.length.times do 
        attack_pos = sliding_locs.pop
      dist[0] = (king_pos[0] - attack_pos[0])
      dist[1] = (king_pos[1] - attack_pos[1])
        if dist[0] == 0
          direction[0] = 0
        elsif dist[0] < 1
          direction[0] = -1
        else
          direction[0] = 1
        end
        if dist[1] == 0
          direction[1] = 0
        elsif dist[1] < 1
          direction[1] = -1
        else
          direction[1] = 1
        end
        loop do  
          attack_pos[0] = (attack_pos[0] + direction[0])
          attack_pos[1] = (attack_pos[1] + direction[1])
          break if attack_pos == king_pos
          heap << [attack_pos[0], attack_pos[1]]
        end
    end
    pieces.select {|piece| piece.color == color}.each do |piece|
      if (piece.available_moves & heap).any?
        puts "y'all can block the mating piece anywhere along #{heap}"
        return true
      else false
      end
    end
  end
end


