module Slideable
  def available_moves
    moves = []

    move_dirs.each do |(dr, dc)|
      current_r, current_c = location
      
      loop do
        current_r += dr
        current_c += dc
        loc = [current_r, current_c]
        # p loc
        break if !board.in_bounds?(loc)

        if enemy?(loc)
          moves << loc
          break
        end
        if board.empty?(loc)
          moves << loc
        else break
        end
      end
    end
    moves
  end
end