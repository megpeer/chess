class Piece

  attr_reader :board, :color
  attr_accessor :location
  def initialize(board, location, color)
    @board = board
    @location = location
    @color = color
  end

  def enemy?(location)
    !board.empty?(location) && board[location].color != color
  end

  def current_r
    location.first
  end

  def current_c
    location.last
  end

end