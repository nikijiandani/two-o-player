class Player
  attr_accessor :name, :lives

  MAX_LIVES = 3

  def initialize(name)
    @name = name
    @lives = MAX_LIVES
  end

  def dead?
    @lives <= 0
  end

end