
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
    puts "#{color} king at position #{king_pos(color)} is being assessed if in check"
    pieces.select {|piece| piece.color != color}.each do |piece|
      if piece.available_moves.include?(king_pos(color))
        puts "yeppers. your boy's in check"
        return true
      end
    end
  end

  def check_mate?(color)
    # enemy_color = nil
    # color == :black ? enemy_color = :white : enemy_color = :black
    
    puts "#{color} king at position #{king_pos(color)} is being assessed if check mated"
    king_moves = self[king_pos(color)].available_moves.flatten
    enemy_moves = []
    mate_moves = []
    checking_pieces = []
    # #CHECK IF ANY KING MOVES ARE POSSIBLE TO ESCAPE ENEMY MOVE LIST
    # pieces.select {|piece| piece.color != color}.each do |piece|
    #   enemy_moves << piece.available_moves
    # end
    # mate_moves = king_moves.reject{ |k| enemy_moves.flatten.include? k }
    # if mate_moves.empty?
    #   puts "mated?!"
    #   return true
    # end
    # p "kings only safe moves out of check are #{mate_moves}"
    

    #CHECK IF ANY ENEMY CHECKING PIECES CAN BE CAPTURED BY PLAYER PIECES
    pieces.select {|piece| piece.color != color}.each do |piece|
      if piece.available_moves.include?(king_pos(color))
        checking_pieces << piece.location
      end
    end

    pieces.select {|piece| piece.color == color}.each do |piece|
      if piece.available_moves.include?(checking_pieces.flatten)
        puts "wahey! a checking piece can be captured at #{checking_pieces.flatten}"
      end
    end

    #CHECK IF SLIDING PIECES CAN BE BLOCKED BY OTHER PIECES
    sliding_pieces(color)
  end

  def king_pos(color)
    pieces.find {|p| p.color == color && p.is_a?(King)}.location
  end

  def pieces
    board.flatten.compact!
  end

  def sliding_pieces(color)
    checking_pieces = []
    sliding_pieces = []
    sliding_locs = []
    pieces.select {|piece| piece.color != color}.each do |piece|
      if piece.available_moves.include?(king_pos(color))
        checking_pieces << piece
        # .location
      end
    end
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
      p "available move: #{piece.available_moves}"
      p "heap moves are #{heap}"
      if (piece.available_moves & heap).any?
        puts "y'all can block that shit anywhere along #{heap}"
        return true
        
      end
    end
  end

  # def player_pieces(color)
  #   pieces.find {|p| p.color == color}
  # end

end


