require 'byebug'
require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game

attr_accessor :board, :player_one, :player_two, :current_player

  def initialize(player_one, player_two)
    @board = Board.new
    @player_one = player_one
    @player_two = player_two
    @current_player = player_one
  end


  def play_turn
    puts "Enter name"
    name = gets.chomp
    @player_one.name = name
    until board.over?
      board.display
      player_one_move = player_one.get_move

      if board.empty?(player_one_move)
        board.place_mark(player_one_move, player_one.mark)
      else
        until board.empty?(player_one_move)
          puts "That position is occupied!!"
          puts "Try again"
          player_one_move = player_one.get_move
        end
        board.place_mark(player_one_move, player_one.mark)
      end

      if winner? || over?
        winner? ? game_won : game_over
        return
      end

      switch_players!
      board.place_mark(player_two.get_move(board), player_two.mark)

      if winner? || over?
        winner? ? game_won : game_over
        return
      end

      switch_players!
    end
  end

  def winner?
    board.winner
  end

  def over?
    board.over?
  end

  def game_won
    board.display
    puts "#{@current_player.name} won the game!"
  end

  def game_over
    board.display
    puts "It\'s a tie"
  end

  def switch_players!
    if @current_player.name == player_one.name
      @current_player = player_two
    elsif @current_player.name == player_two.name
      @current_player = player_one
    end
    return @current_player
  end



end

human = HumanPlayer.new("Alan")
comp = ComputerPlayer.new("Dave")
game = Game.new(human, comp)
game.play_turn
