class Knight < Piece
  include Stepable

  def to_s
    color == :black ? "♘" : "♞"
  end

  def move_dirs
    [
      [2, 1],
      [-2, 1],
      [-2, -1],
      [1, 2],
      [1, -2],
      [-1, 2],
      [-1, -2]
    ]
  end
end