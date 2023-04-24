class Frame
  attr_accessor :strike_bonus, :spare_bonus, :roll_1_pins, :roll_2_pins, :roll_3

  def initialize
    @strike_bonus, @spare_bonus = false, false
    @roll_1_pins, @roll_2_pins = nil, nil
  end

  def roll_1(pins_down)
    @roll_1_pins = pins_down
    @roll_1_pins = 10 if pins_down > 10
    @strike_bonus = true if @roll_1_pins == 10
  end

  def roll_2(pins_down)
    @roll_2_pins = pins_down
    @roll_2_pins = 10 - @roll_1_pins if @roll_1_pins + pins_down > 10
    @spare_bonus = true if @roll_1_pins + @roll_2_pins == 10
  end

end