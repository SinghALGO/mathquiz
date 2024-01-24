require './questions.rb'
require './players.rb'


class Game 
  def initialize
    @player1 = Players.new(1)
    @player2 = Players.new(2)
    @current_player = @player1
  end
  
  def run_game
    while @player1.lives > 0 && @player2.lives > 0
      question = Question.new
      question.ask_question(@current_player)
      answer = gets.chomp.to_i
      result = question.check(answer)

      if result
        puts "YES! You are correct."
      else
        puts "Seriously? No!"
        @current_player.lives_minus
      end

      display_scores
      switch_player
    end

    announce_winner
  end
  
  def display_scores
    puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
  end

  def switch_player
    puts "----NEW TURN----"
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end

    def announce_winner
      if @player1.lives > @player2.lives
        puts "Player 1 wins with a score of #{@player1.lives}/3"
      elsif @player2.lives > @player1.lives
        puts "Player 2 wins with a score of #{@player2.lives}/3"
      else
        puts "It's a tie!"
      end
      puts "GAME OVER\nGoodbye!"
    end

end

game = Game.new
game.run_game
