class Frame
  attr_accessor :pins_1, :pins_2, :pins_3, :strike, :spare

  def initialize
    @strike, @spare = false, false
    @pins_1, @pins_2, @pins_3 = nil, nil, nil
  end

  def roll_1(pins_down)
    @pins_1 = pins_down
    @pins_1 = 10 if pins_down > 10
    @strike = true if @pins_1 == 10
  end

  def roll_2(pins_down)
    @pins_2 = pins_down
    @pins_2 = 10 - @pins_1 if @pins_1 + pins_down > 10
    @spare = true if @pins_1 + @pins_2 == 10
  end
  
  def roll_2_final_after_strike(pins_down) # for when final frame roll 1 was a strike
    @pins_2 = pins_down
    @pins_2 = 10 if pins_down > 10
    @strike = true if @pins_2 == 10
  end
  
  def roll_3(pins_down) # for when roll 1 was a strike but not roll 2
    @pins_3 = pins_down
    @pins_3 = 10 - @pins_2 if @pins_2 + pins_down > 10
  end

  def roll_3_after_strike_or_spare(pins_down) # after double strike or spare
    @pins_3 = pins_down
    @pins_3 = 10 if pins_down > 10
  end
end