# require_relative './user'
require_relative './frame'
require_relative './score'

class Game
  attr_accessor :frames
  attr_reader :in_progress

  def initialize
    @frame = Frame.new
    @frames = []
    # p @frames
    @roll_again = true
  end

  def add_roll(pins)

    if @frames.length == 9 #### Do FINAL FRAME STUFF
      puts "FINAL FRAME!"
      @frame.add_roll(pins) # add roll 1 to this frame
      if @frame.length == 2 
        end_game() unless @frame.strike?
      elsif @frame.length == 3
        end_game()
      end
      
    elsif @frame.length == 0 ## IF roll 1...
      @frame.add_roll(pins) # add roll 1 to this frame

      if @frame.strike? ## IF roll 1 is strike...
        @frame.add_roll(0) # add roll 2 to this frame as 0 pins
        @frame = new_frame() # add frame to frames and make new frame
      end
    else @frame.add_roll(pins) # add roll 2 to this frame
      @frame = new_frame() # add frame to frames and make new frame
    end
    # print "frame = " # VISIBILTY
    # p @frame # VISIBILTY
    # print "frame = " # VISIBILTY
    # p @frame # VISIBILTY
    
    # below adds frame to frames and makes a new frame
    # if pins == 10 
    #   @frame = new_frame()
    # # elsif 
    # end
    @frames.each_with_index do |frame, index| 
    end
  end

  def new_frame
    @frames << @frame
    Frame.new
  end

  def end_game
    @frames << @frame
    @roll_again = false
  end

  def roll_again?
    return @roll_again
  end

  def strike?
    return false if @frames.length == 9 && @frame.length > 0 # false for last frame
    puts "first roll strike!" if @frames.length == 0 || @frame.length > 0
    return true if @frames.length == 0 || @frame.strike? # first roll strike
    puts "no rolls strike warning!" if @frames.length == 0 || @frame.length > 0
    return false if @frames.length == 0 || @frame.length > 0 # no rolls have happened yet so no enquiry possible
    @frames[-1].strike?
  end

  def bonus_roll
    @frames.length == 9 && @frame.length > 0 && @frame.frame_points[0] == 10
  end

  def scores
    score = Score.new(@frames)
    score.calculate_scores()
  end
end
