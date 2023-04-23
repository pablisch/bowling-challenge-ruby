class Game
  attr_accessor :score_card, :game_scores, :frames, :frame_number, :total_score

  def initialize
    @score_card = []
    @game_scores = []
    @frames = []
    @frame_number = 1
    @total_score = 0
  end

  def add_frame(frame)
    @frames << frame
    @frame_number += 1
  end

  def add_to_scores(pins_down)
    game_scores << pins_down
  end

  def scores_on_the_doors
    frames.each_with_index do |frame, index|
      frame_score, bonus = 0, 0
      if @frame_number < 10 # NOT last frame
        frame_score = frame_scoring(frame, index, frame_score)
      else
        frame_score = last_frame_scoring(frame, frame_score)
      end
      @total_score += frame_score
      unless frame == frames[-1] && @game_scores.length.odd? # unless last frame with a strike
        roll_stats(frame, index, frame_score)
      else
        bonus_roll_stats(frame, index, frame_score)
      end
    end
    print_scores()
  end

  private

  def print_scores
    puts
    @score_card.each{ |line|
        puts "frame: #{line[:frame]}, roll no. #{line[:roll]}, pins knocked: #{line[:pins]}#{", frame score: #{line[:frame_score]}, total: #{line[:total_score]}" if line[:frame_score]}#{", notes: #{line[:notes]}" if line[:notes]}" }
    puts "\nFINAL SCORE is #{@total_score}"
  end

  def frame_scoring(frame, index, frame_score)
    frame_score += frame.roll_1_pins
        frame_score += frame.roll_2_pins unless frame.roll_2_pins.nil?
        if frame.strike_bonus || frame.spare_bonus # strike or spare bonus is true
          bonus = @game_scores[((index + 1) * 2)] # roll 1 of next frame
          if frame.strike_bonus && bonus == 10 # this and the next were strikes!
            bonus += @game_scores[((index + 2) * 2)] # roll 1 of two frames ahead... or roll 3 of last frame
          elsif frame.strike_bonus
            bonus += @game_scores[((index + 1) * 2) + 1] # roll 2 of next frame
          end
        end
        frame_score += bonus
  end

  def last_frame_scoring(frame, frame_score)
    if @game_scores.length.even? # no final frame strike or spare
      frame_score += @game_scores[-2, 2].sum # last two rolls
    else # bonus roll was taken
      frame_score += @game_scores[-3, 3].sum # last three rolls
    end
  end

  def roll_stats(frame, index, frame_score)
    frame.roll_2_pins = "-" if frame.roll_2_pins.nil?
    frame_info = {frame: index + 1, roll: 1, pins: frame.roll_1_pins }
    @score_card << frame_info
    frame_info = {frame: index + 1, roll: 2, pins: frame.roll_2_pins, frame_score: frame_score, total_score: @total_score, notes: score_card_notes(frame) }
    @score_card << frame_info
  end

  def bonus_roll_stats(frame, index, frame_score)
    frame_info = {frame: index + 1, roll: 1, pins: @game_scores[-3] }
    @score_card << frame_info
    frame_info = {frame: index + 1, roll: 2, pins: @game_scores[-2] }
    @score_card << frame_info
    frame_info = {frame: index + 1, roll: 3, pins: @game_scores[-1], frame_score: frame_score, total_score: @total_score, notes: score_card_notes(frame) }
    @score_card << frame_info
  end

  def score_card_notes(frame)
    return "Strike" if frame.strike_bonus
    return "Spare" if frame.spare_bonus
  end

end