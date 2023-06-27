require_relative './lib/frame.rb'
require_relative 'lib/game.rb'

class Application
  def initialize(io)
    @io = io
  end

  def run
    @game = Game.new
    3.times do
      @frame = Frame.new
      # visibility_frame_number() # VISIBILITY
      pins_down = roll(1)
      pins_down = roll(2) if pins_down < 10
      # visibility_after_rolls() # VISIBILITY
      @game.add_frame(@frame)
      # visibility_game_and_frame() # VISIBILITY
    end
    @game.scores_on_the_doors()
  end

  def roll(roll_number)
    pins_down = ask("Enter number of pins knocked down for roll #{roll_number}: ").to_i
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

  ### HELPER METHODS

  def visibility_frame_number ### TEST METHOD FOR VISIBILITY
    puts "This is frame #{@game.frame_number() + 1}"
  end

  def visibility_after_rolls ### TEST METHOD FOR VISIBILITY
    puts "strike_bonus_1 is #{@frame.strike_bonus_1}"
    puts "strike_bonus_2 is #{@frame.strike_bonus_2}"
    puts "spare_bonus is #{@frame.spare_bonus}"
    puts "roll 1 was #{@frame.roll_1_pins}"
    puts "roll 2 was #{@frame.roll_2_pins}"
  end

  def visibility_game_and_frame ### TEST METHOD FOR VISIBILITY
    print "game is "
    p @game
    print "frame is "
    p @frame
  end

  def say(message)
    @io.puts(message)
  end

  def ask(question)
    @io.puts(question)
    @io.gets.chomp
  end

  def ask_inline(question)
    @io.print(question)
    @io.gets.chomp
  end

end

if __FILE__ == $0
  app = Application.new(
    Kernel
  )
  app.run
end

