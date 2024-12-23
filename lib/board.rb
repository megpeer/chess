

class Board
  attr_reader :grid
  def initialize 
    @grid = Array.new(8) {Array.new(8, ".")}
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
  
  def display_board
    puts " A B C D E F G H"
    puts "1 #{grid[0]}"
    puts "2 #{grid[1]}"
    puts "3 #{grid[2]}"
    puts "4 #{grid[3]}"
    puts "5 #{grid[4]}"
    puts "6 #{grid[5]}"
    puts "7 #{grid[6]}"
    puts "8 #{grid[7]}"
  end
end


