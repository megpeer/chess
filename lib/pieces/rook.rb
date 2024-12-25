class Rook

  attr_reader :color

  def initialize(color)
    @color = color
  end

  def to_s
    color == :black ? "♖" : "♜"
  end

  def move dirs
    [
      [0, 1],
      [0, 2]
    ]
  end
end