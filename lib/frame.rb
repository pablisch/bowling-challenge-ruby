class Frame
  attr_accessor :strike_bonus_1, :strike_bonus_2, :spare_bonus, :roll_1_pins, :roll_2_pins

  def initialize
    @strike_bonus_1, @strike_bonus_2, @spare_bonus = 0, 0, 0
    @roll_1_pins, @roll_2_pins = 0, 0
  end

  def roll_1(pins_down)
    @roll_1_pins = pins_down
    @roll_1_pins = 10 if pins_down > 10
    @strike_bonus_2 = 1 if @roll_1_pins == 10
  end

  def roll_2(pins_down)
    @roll_2_pins = pins_down
    @roll_2_pins = 10 - @roll_1_pins if @roll_1_pins + pins_down > 10
    @spare_bonus = 1 if @roll_1_pins + @roll_2_pins == 10
  end
end