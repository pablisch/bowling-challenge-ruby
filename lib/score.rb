require_relative './frame'

class Score
  def initialize(frames)
    @frames = frames
    @total = @frames.map { |frame| [frame.frame_points] }.flatten.compact.sum # base score
  end

  def calculate_scores
    puts "base total = #{@total}"
    @frames.each_with_index do |frame, index|
      puts "#{index + 1}: #{frame}"
      puts "index = #{index} and frame point = #{frame.frame_points}"
      # puts "index = #{index} and length = #{@frames.length}"
      if (index + 1) < @frames.length # anything but final frame
        # if frame.frame_points[0] == 10 # strike
        if frame.strike? # strike
          strike(index)
        elsif frame.frame_points[0] + frame.frame_points[1] == 10 # spare
          @total += @frames[index + 1].frame_points[0]
        end
      end
    end
    puts "final total = #{@total}"
    return @total
  end

  def strike(index)
    puts "frame calling strike? is #{@frames[index]}"
    pre_strike_total = @total
    @total += @frames[index + 1].frame_points[0] # next frame roll 1
    if @frames[index + 1].strike? && index != 8 # if next roll is strikeand not frame 9
      @total += @frames[index + 2].frame_points[0] # two frames on roll 1
    else 
      @total += @frames[index + 1].frame_points[1] # next frame roll 2
    end
  puts "#{index + 1} bonus is #{@total - pre_strike_total}"
  end
end