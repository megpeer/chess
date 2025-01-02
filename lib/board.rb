
require_relative "pieces/pieces"


class Board
  attr_reader :grid
  def initialize 
    @grid = Array.new(8) {Array.new(8, "᛫")}
    # assign_pieces
  end


  #assign pieces
  def assign_pieces
        
    grid[1].map! { |x| x = Pawn.new(:black).to_s }
    grid[6].map! { |x| x = Pawn.new(:white).to_s }


    grid[0][2] = Bishop.new(:black).to_s
    grid[7][2] = Bishop.new(:white).to_s

    grid[0][5] = Bishop.new(:black).to_s
    grid[7][5] = Bishop.new(:white).to_s

    grid[0][3] = King.new(:black).to_s
    grid[7][3] = King.new(:white).to_s
    grid[0][4] = Queen.new(:black).to_s
    grid[7][4] = Queen.new(:white).to_s

    grid[0][1] = Knight.new(:black).to_s
    grid[7][1] = Knight.new(:white).to_s

    grid[0][6] = Knight.new(:black).to_s
    grid[7][6] = Knight.new(:white).to_s

    grid[0][0] = Rook.new(:black).to_s
    grid[7][0] = Rook.new(:white).to_s

    grid[0][7] = Rook.new(:black).to_s
    grid[7][7] = Rook.new(:white).to_s
  end

    # set
    def []=(location, piece)
      row, column = location
      grid[row][column] = piece
    end
  
    # get
    def [](location)
      row, column = location
      grid[row][column]
    end
  
    #in bounds?
    def in_bounds?(location)
      row, column = location
      row < grid.length &&
      column < grid.first.length &&
      row >= 0 &&
      column >= 0
    end

    def empty?(location)
      row, column = location
      grid[row][column] == "᛫"
    end
  
    

  def display_board

    p "  1| #{grid[0][0]} #{grid[0][1]} #{grid[0][2]} #{grid[0][3]} #{grid[0][4]} #{grid[0][5]} #{grid[0][6]} #{grid[0][7]} |"
    p "  2| #{grid[1][0]} #{grid[1][1]} #{grid[1][2]} #{grid[1][3]} #{grid[1][4]} #{grid[1][5]} #{grid[1][6]} #{grid[1][7]} |"
    p "  3| #{grid[2][0]} #{grid[2][1]} #{grid[2][2]} #{grid[2][3]} #{grid[2][4]} #{grid[2][5]} #{grid[2][6]} #{grid[2][7]} |"
    p "  4| #{grid[3][0]} #{grid[3][1]} #{grid[3][2]} #{grid[3][3]} #{grid[3][4]} #{grid[3][5]} #{grid[3][6]} #{grid[3][7]} |"
    p "  5| #{grid[4][0]} #{grid[4][1]} #{grid[4][2]} #{grid[4][3]} #{grid[4][4]} #{grid[4][5]} #{grid[4][6]} #{grid[4][7]} |"
    p "  6| #{grid[5][0]} #{grid[5][1]} #{grid[5][2]} #{grid[5][3]} #{grid[5][4]} #{grid[5][5]} #{grid[5][6]} #{grid[5][7]} |"
    p "  7| #{grid[6][0]} #{grid[6][1]} #{grid[6][2]} #{grid[6][3]} #{grid[6][4]} #{grid[6][5]} #{grid[6][6]} #{grid[6][7]} |"
    p "  8| #{grid[7][0]} #{grid[7][1]} #{grid[7][2]} #{grid[7][3]} #{grid[7][4]} #{grid[7][5]} #{grid[7][6]} #{grid[7][7]} |"
    p "     a b c d e f g h"
  end
end


