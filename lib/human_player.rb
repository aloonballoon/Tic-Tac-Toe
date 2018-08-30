

class HumanPlayer

  attr_reader :name, :move, :mark, :pos, :grid

  def initialize(name)
    @name = name
    @mark = :X
  end

  def get_move
    puts "Where do you want to move? (row, column)"
    gets.chomp.split(",").map {|x| x.to_i}
  end

  def name=(name)
    @name = name
  end


end
