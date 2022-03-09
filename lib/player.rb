class Player
  DEFAULT_HP = 10
  attr_reader :name, :hit_points
   
  def initialize(name)
    @name = name
    @hit_points = DEFAULT_HP
  end

  def reduce_hp
    @hit_points -= 1
  end

end
