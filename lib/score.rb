require_relative './frame'

class Score
  def initialize(frames)
    @frames = frames
    @total = @frames.map { |frame| [frame.pins_1, frame.pins_2, frame.pins_3] }.flatten.compact.sum # base score
  end

  def score
    p @frames
    # puts "base total = #{@total}"
    @frames.each_with_index do |frame, index|
      # puts "index = #{index} and length = #{@frames.length}"
      if (index + 1) < @frames.length
        if frame.pins_1 == 10
          strike(index)
        elsif frame.pins_1 + frame.pins_2 == 10
          @total += @frames[index + 1].pins_1
        end
      end
    end
    return @total
  end

  def strike(index)
    @total += @frames[index + 1].pins_1
    if @frames[index + 1].pins_2.nil?
      @total += @frames[index + 2].pins_1
    else 
      @total += @frames[index + 1].pins_2
    end
  end
end