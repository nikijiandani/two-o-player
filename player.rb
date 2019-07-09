class Player
  attr_reader :name
  attr_accessor :lives

  MAX_LIVES = 3

  def initialize(name)
    @name = name
    @lives = MAX_LIVES
  end

  def dead?
    @lives <= 0
  end

  def lose_a_life
    @lives -= 1
  end

end