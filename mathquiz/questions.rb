require './players.rb'

class Question 
  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
  end

  def ask_question(player)
    puts "#{player.id == 1 ? 'Player 1' : 'Player 2'}: What does #{@num1} plus #{@num2} equal?"
  end

  def check(answer)
    answer == @num1 + @num2
  end

end