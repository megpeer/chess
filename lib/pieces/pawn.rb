class Pawn < Piece

  def to_s
    color == :black ? "♙" : "♟"
  end

  def forward_direction 
    color == :black ? 1 : -1
  end

  def starting_row?
    color == :black && current_r == 1 ||
    color == :white && current_r == 6
  end

  def available_moves
    moves = []

    #move forward one
    one_forward = [(current_r + forward_direction), current_c]
    two_forward = [(current_r + (forward_direction * 2)), current_c]
    diag_left = [(current_r + forward_direction), (current_c + 1)]
    diag_right = [(current_r + forward_direction), (current_c - 1)]

    if board.empty?(one_forward)
      moves << one_forward
    end
    
    if board.empty?(one_forward) && 
      board.empty?(two_forward) && 
      starting_row?
      moves << two_forward
    end

    if enemy?(diag_right)
      moves << diag_right
    end
    if enemy?(diag_left)
      moves << diag_left
    end
    moves
  end
    
end



