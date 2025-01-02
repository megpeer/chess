class Piece

  attr_reader :board, :location, :color
  def initialize(board, location, color)
    @board = board
    @location = location
    @color = color
  end

  def enemy?(location)
    board[location] != "᛫" && board[location].color != color
  end


end