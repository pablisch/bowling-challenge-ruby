class Frame
  attr_reader :frame_points

  def initialize
    @frame_points = []
  end

  def add_roll(pins)
    p "HEELO RSPEC!"
    @frame_points << pins # if @frame_points.length == 0
    # p @frame_points
  end

  def strike?
    @frame_points[0] == 10
  end

  def spare?
    @frame_points[0] < 10 && @frame_points.sum == 10
  end

  def length
    return @frame_points.length
  end
end