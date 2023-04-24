require_relative './lib/frame.rb'
require_relative 'lib/game.rb'

class Application
  def initialize(io)
    @io = io
    @game = Game.new
    @frame = Frame.new
  end

  def run
    @game = Game.new
    9.times do # all but last frame
      @frame = Frame.new
      pins_down = roll(1)
      @game.add_to_scores(@frame.roll_1_pins)
      pins_down = roll(2) if pins_down < 10
      @game.add_to_scores(@frame.roll_2_pins)
      @game.add_frame(@frame)
    end
    final_frame()
    @game.scores_on_the_doors()
  end

  def final_frame
    @frame = Frame.new
    pins_down = roll(1)
    @game.add_to_scores(@frame.roll_1_pins)
    if pins_down == 10 # if roll 1 is a strike
      last_frame_strike(pins_down)
    else # Take 2nd roll at remaining pins
      last_frame_no_strike(pins_down)
    end
    @game.add_frame(@frame)
  end

  def last_frame_strike(pins_down)
    pins_down = roll(1)
    @game.add_to_scores(@frame.roll_1_pins)
    if pins_down == 10 # if roll 2 is a strike, take last roll, new pins
      pins_down = roll(1)
      @game.add_to_scores(@frame.roll_1_pins)
    else # if roll 2 is not a strike, take last roll
      pins_down = roll(2)
      @game.add_to_scores(@frame.roll_2_pins)
    end
  end

  def last_frame_no_strike(pins_down)
    pins_down = roll(2)
    @game.add_to_scores(@frame.roll_2_pins)
    if @frame.spare_bonus == true
      pins_down = roll(1)
      @game.add_to_scores(@frame.roll_1_pins)
    end
  end

  def roll(roll_number)
    @io.puts "Frame #{@game.frame_number} roll #{roll_number} pins knocked over: "
    pins_down = @io.gets.chomp.to_i
    roll_manager(roll_number, pins_down)
    return pins_down
  end

  def roll_manager(roll_number, pins_down)
    if roll_number == 1
      @frame.roll_1(pins_down)
    else 
      @frame.roll_2(pins_down)
    end
    return pins_down
  end
end

if __FILE__ == $0
  app = Application.new(
    Kernel
  )
  app.run
end

