require 'byebug'

class ComputerPlayer

  attr_accessor :name, :board, :grid, :mark

  def initialize(name)
    @name = name
    @mark = :O
  end

  def display(board)
    @board = board
  end

  def get_move(board)
    potential_moves = []
    all_moves = [
                        [0,0], [0,1], [0,2],
                        [1,0], [1,1], [1,2],
                        [2,0], [2,1], [2,2]
                                            ]
    all_moves.each do |spot|
      if board.empty?(spot)
        potential_moves << spot
      end
    end



  potential_moves.each do |move|
      board.place_mark(move, mark)
      if board.winner == mark
        return move
      else
        board.place_mark(move, nil)
      end
    end
    potential_moves.sample
  end

end
