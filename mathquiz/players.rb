class Players
  attr_reader :lives, :id
  
  def initialize(id)
    @lives = 3
    @id = id
  end
  
  def lives_minus
    @lives -= 1
  end
end