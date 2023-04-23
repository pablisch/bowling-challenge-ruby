require 'frame'

RSpec.describe Frame do

  let(:frame) { Frame.new }

  context "#roll_1" do
    it "sets @roll_1_pins to the number of pins knocked down" do
      frame.roll_1(7)
      expect(frame.roll_1_pins).to eq 7
    end

    it "sets @roll_1_pins to 10 if the number of pins knocked down is greater than 10" do
      frame.roll_1(11)
      expect(frame.roll_1_pins).to eq(10)
    end

    it "sets @strike_bonus to true if @roll_1_pins is 10" do
      frame.roll_1(10)
      expect(frame.strike_bonus).to be_truthy
    end
  end

  context "#roll_2" do
    it "sets @roll_2_pins to the number of pins knocked down" do
      frame.roll_1(1)
      frame.roll_2(7)
      expect(frame.roll_2_pins).to eq 7
    end

    it "sets @roll_2_pins to maximum possible if the total number of pins knocked down is greater than 10" do
      frame.roll_1(7)
      frame.roll_2(6)
      expect(frame.roll_2_pins).to eq(3)
    end

    it "sets @spare_bonus to true if total knocked pins is 10" do
      frame.roll_1(8)
      frame.roll_2(2)
      expect(frame.spare_bonus).to be_truthy
    end

    it "sets @spare_bonus to true if roll_2_pins is 10" do
      frame.roll_1(0)
      frame.roll_2(10)
      expect(frame.spare_bonus).to be_truthy
    end

    it "sets @strike_bonus to false even if @roll_2_pins is 10" do
      frame.roll_1(0)
      frame.roll_2(10)
      expect(frame.strike_bonus).to be_falsy
    end
  end
end