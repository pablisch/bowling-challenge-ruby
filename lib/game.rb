require_relative './user'
require_relative './frame'
require_relative './score'

class Game
  attr_accessor :frames
  attr_reader :in_progress

  def initialize
    @user = User.new
    @frames = []
  end

  def run
    until @frames.length >= 9 # set to 9 for TEN FRAME GAME
      frame_number = @frames.length + 1 # used for UI message
      frame = Frame.new
      frame.roll_1(@user.roll(frame_number, 1)) # roll 1
      frame.roll_2(@user.roll(frame_number, 2)) unless frame.strike # roll 2
      @frames << frame # add current frame object to frames array
    end
    
    final_frame()
    score = Score.new(@frames)
    @user.score(score.score) # calculate score and send to user
    # @user == User Interface object
    # @user.score is the method that outputs the final score
    # with an argument which is the score method of the Score object
  end
  
  def final_frame
    frame_number = @frames.length + 1
    frame = Frame.new
    frame.roll_1(@user.roll(frame_number, 1)) # r1 
    if frame.strike # r1 is a strike
      frame.strike = false
      frame.roll_2_final_after_strike(@user.roll(frame_number, 2)) # r2 if r1 was a strike
      if frame.strike # r2 is a strike
        frame.roll_3_after_strike_or_spare(@user.roll(frame_number, 3)) # r3 after 2nd strike
      else # r2 is NOT a strike
        frame.roll_3(@user.roll(frame_number, 3)) # roll 3 when 1st was strike but 2nd was NOT
      end

    else # r1 is NOT a strike
      frame.roll_2(@user.roll(frame_number, 2)) # standard r2
      frame.roll_3_after_strike_or_spare(@user.roll(frame_number, 3)) if frame.spare # bonus roll after spare
    end
    @frames << frame
  end
end

if __FILE__ == $0
  game = Game.new
  game.run
end