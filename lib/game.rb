class Game
  attr_accessor :game_score, :frames, :frame_number

  def initialize
    @game_score = []
    @frames = []
    @frame_number = 0
  end

  def add_frame(frame)
    @frames << frame
    @frame_number += 1
  end

  def scores_on_the_doors
    puts # TEST SPACER
    frames.each_with_index do |frame, index|
      frame_score = frame.roll_1_pins + frame.roll_2_pins
      if frame.strike_bonus_2 == 1
        frame_score += frames[index + 1].roll_1_pins
      end
      p frame.roll_1_pins
      p frame.roll_2_pins
    end
  end

end