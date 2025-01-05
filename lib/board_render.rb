class BoardRender
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def render
    system('clear') 
    row = 0
    8.times do |r|
      print "#{row}" 
      row +=1
      
      8.times do |c|
        piece = board[[r, c]]
        if piece.nil?
          print " · "
        else
      print " #{board[[r, c]]} "
        end
      end
      puts ""
  end
    puts "  0  1  2  3  4  5  6  7"
  end

end
