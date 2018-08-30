require 'byebug'

class Board
  attr_accessor :grid, :pos, :mark

  def initialize(grid = Array.new(3) {Array.new(3)})
    @grid = grid
    @pos = pos
    @mark = mark
  end

  def place_mark(pos, mark)
      grid[pos[0]][pos[1]] = mark
  end

  def empty?(pos)
    return true if grid[pos[0]][pos[1]] == nil
    return false
  end

  def winner
    #top row
    if grid[0][0] == :X && grid[0][1] == :X && grid[0][2] == :X
      return :X
    elsif (grid[0][0] == :O) && (grid[0][1] == :O) && (grid[0][2] == :O)
      return :O

    # middle row
    elsif grid[1][0] == :X && grid[1][1] == :X && grid[1][2] == :X
      return :X
    elsif grid[1][0] == :O && grid[1][1] == :O && grid[1][2] == :O
      return :O

    #bottom row
    elsif grid[2][0] == :X && grid[2][1] == :X && grid[2][2] == :X
      return :X
    elsif grid[2][0] == :O && grid[2][1] == :O && grid[2][2] == :O
      return :O

    # left column
    elsif grid[0][0] == :X && grid[1][0] == :X && grid[2][0] == :X
      return :X
    elsif grid[0][0] == :O && grid[1][0] == :O && grid[2][0] == :O
      return :O

    # middle column
    elsif grid[0][1] == :X && grid[1][1] == :X && grid[2][1] == :X
      return :X
    elsif grid[0][1] == :O && grid[1][1] == :O && grid[2][1] == :O
      return :O

    # right column
    elsif grid[0][2] == :X && grid[1][2] == :X && grid[2][2] == :X
      return :X
    elsif grid[0][2] == :O && grid[1][2] == :O && grid[2][2] == :O
      return :O

    #left diagonal
    elsif grid[0][0] == :X && grid[1][1] == :X && grid[2][2] == :X
      return :X
    elsif grid[0][0] == :O && grid[1][1] == :O && grid[2][2] == :O
      return :O

    #right diagonal
    elsif grid[0][2] == :X && grid[1][1] == :X && grid[2][0] == :X
      return :X
    elsif grid[0][2] == :O && grid[1][1] == :O && grid[2][0] == :O
      return :O
    else
      return nil
    end
  end

  def over?
    if winner == :X || winner == :O
      return true
    elsif grid[0][0,3].include?(nil) || grid[1][0,3].include?(nil) || grid[2][0,3].include?(nil)
      return false
    else
      return true
    end
  end

  def display

    pos1 = if grid[0][0] == :X
            :X
          elsif grid[0][0] == :O
            :O
          else " "
           end

    pos2 = if grid[0][1] == :X
            :X
          elsif grid[0][1] == :O
            :O
          else " "
           end
    pos3 = if grid[0][2] == :X
            :X
          elsif grid[0][2] == :O
            :O
          else " "
           end
    pos4 = if grid[1][0] == :X
            :X
          elsif grid[1][0] == :O
            :O
          else " "
           end
    pos5 = if grid[1][1] == :X
            :X
          elsif grid[1][1] == :O
            :O
          else " "
           end
    pos6 = if grid[1][2] == :X
            :X
          elsif grid[1][2] == :O
            :O
          else " "
           end
    pos7 = if grid[2][0] == :X
            :X
          elsif grid[2][0] == :O
            :O
          else " "
           end
    pos8 = if grid[2][1] == :X
            :X
          elsif grid[2][1] == :O
            :O
          else " "
           end
    pos9 = if grid[2][2] == :X
            :X
          elsif grid[2][2] == :O
            :O
          else " "
          end



    row1 = "     0    1     2"
    row2 = "   ________________"
    row3 = "0 |  #{pos1}  |  #{pos2}  |  #{pos3} |"
    row4 = "  |----------------"
    row5 = "1 |  #{pos4}  |  #{pos5}  |  #{pos6} |"
    row6 = "  |----------------"
    row7 = "2 |  #{pos7}  |  #{pos8}  |  #{pos9} |"
    row8 = "  |----------------"

    puts row1
    puts row2
    puts row3
    puts row4
    puts row5
    puts row6
    puts row7
    puts row8

  end


end
