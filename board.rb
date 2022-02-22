require "byebug"

# module Greetable
#   def greet
#     "Hello, my name is #{self.name}"
#   end
# end

module Slideable
  HORIZONTAL_DIRS = []
  DIAGONAL_DIRS = []

  def self.grow_unblocked_moves_in_dir(dx, dy) # dx = row, dy = column

  end

  def moves

  end

  def move_drs

  end
end

module Stepable
  


end

class Rook
  #find all possible positions for a rook
  HORIZONTAL_DIRS = []
  VERTICAL_DIRS = []

  attr_reader :board, :pos

  def initialize(color, board, pos)
    @pos = pos
    @board = board
    @symbol = :Rook
  end

  def grow_unblocked_moves_in_dir(pos) #[0, 0]
    
    #fill up horizontal dirs ->right moves
    
    #shovel to horizontal dirs if spot to the right is a null piece
    row, col = pos
    
    # until row is invalid || hits a second piece || hits piece on same team
    until !@board.valid_pos?([row+1, col]) || self.next_pos_opponent?(row+1, col)  
      row += 1
      HORIZONTAL_DIRS << [row, col]
    end


    # #this is for vertical
    # until !@board.valid_pos?([row, col+1]) || next_pos_opponent?(row, col+1)  
    #   row += 1
    #   VERTICAL_DIRS << [row, col]
    # end

  end

  def next_pos_opponent?(row, col)
    #is the next spot on the board the opposite color?
    
    if @board[position] == a piece
      if its an opponent
          #Blasjd
      else #its a piece on the same team
        dont include it
      end



    end
  end





end









class Piece
  attr_reader :piece_value
  def initialize()
    @piece_value = :Piece
  end



end

class NullPiece
  attr_reader :piece_value
  def initialize 
    @piece_value = :NullPiece
  end
end

class Board
  
  attr_accessor :grid

  def initialize
    @grid = Array.new(8){ Array.new(8) } #two-d array for chess board
    populate_grid
  end

  def populate_grid #later, we will have to fix this so that the correct pieces are in the right places!
    piece_rows = [0, 1, 6, 7]

    (0...@grid.length).each do |row_idx|
      (0...@grid[row_idx].length).each do |ele_idx| #col
        if piece_rows.include?(row_idx)  
          # row_idx, ele_idx
          @grid[row_idx][ele_idx] = Piece.new()   #piece placeholder 
        else 
          @grid[row_idx][ele_idx] = NullPiece.new
        end
      end
    end
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def move_piece(start_pos, end_pos)
    debugger
    start_row, start_col = start_pos
    raise "Off the board!" if !self.valid_pos?(start_pos) || !self.valid_pos?(end_pos)
    raise "No Piece here" if self[start_pos].is_a?(NullPiece) #placeholder
    
    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.new
    # You can't capture your own piece!! -Old lady
      #Don't forget to code a raise for this!
    true
  end

  def valid_pos?(pos)
    row, col = pos
    return (0..7).include?(row) && (0..7).include?(col)
  end

  # def add_piece(piece, pos)
  # end

  def print_grid
    @grid.each do |row|
      row.each do |ele|
        print ele.piece_value.to_s + " "
      end
      puts
    end
  end

end


