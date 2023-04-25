require 'frame'

RSpec.describe Frame do

  let(:frame) { Frame.new }

  context "#roll_1" do
    it "sets @pins_1 to the number of pins knocked down when 7" do
      frame.roll_1(7)
      expect(frame.pins_1).to eq 7
    end

    it "sets @pins_1 to 10 if the number of pins knocked down is greater than 10" do
      frame.roll_1(11)
      expect(frame.pins_1).to eq(10)
    end

    it "sets @pins_1 to the number of pins knocked down when 0" do
      frame.roll_1(0)
      expect(frame.pins_1).to eq 0
    end

    it "sets @strike to true if @pins_1 is 10" do
      frame.roll_1(10)
      expect(frame.strike).to be_truthy
    end
  end

  context "#roll_2" do
    it "sets @pins_2 to the number of pins knocked down" do
      frame.roll_1(1)
      frame.roll_2(7)
      expect(frame.pins_2).to eq 7
    end

    it "sets @pins_2 to maximum possible if the total number of pins knocked down is greater than 10" do
      frame.roll_1(7)
      frame.roll_2(6)
      expect(frame.pins_2).to eq(3)
    end

    it "sets @spare to true if total knocked pins is 10" do
      frame.roll_1(8)
      frame.roll_2(2)
      expect(frame.spare).to be_truthy
    end

    it "sets @spare to true if pins_2 is 10" do
      frame.roll_1(0)
      frame.roll_2(10)
      expect(frame.spare).to be_truthy
    end

    it "sets @strike to false even if @pins_2 is 10" do
      frame.roll_1(0)
      frame.roll_2(10)
      expect(frame.strike).to be_falsy
    end
  end

  context "#roll_2_final_after_strike" do
    it "sets @pins_2 to the number of pins knocked down when 7" do
      frame.roll_2_final_after_strike(7)
      expect(frame.pins_2).to eq 7
    end

    it "sets @pins_2 to 10 if the number of pins knocked down is greater than 10" do
      frame.roll_2_final_after_strike(11)
      expect(frame.pins_2).to eq(10)
    end

    it "sets @pins_2 to the number of pins knocked down when 0" do
      frame.roll_2_final_after_strike(0)
      expect(frame.pins_2).to eq 0
    end

    it "sets @strike to true if @pins_2 is 10" do
      frame.roll_2_final_after_strike(10)
      expect(frame.strike).to be_truthy
    end
  end

  context "#roll_3_after_strike_or_spare" do
    it "sets @pins_3 to the number of pins knocked down when 7" do
      frame.roll_3_after_strike_or_spare(7)
      expect(frame.pins_3).to eq 7
    end

    it "sets @pins_3 to 10 if the number of pins knocked down is greater than 10" do
      frame.roll_3_after_strike_or_spare(11)
      expect(frame.pins_3).to eq(10)
    end

    it "sets @pins_3 to the number of pins knocked down when 0" do
      frame.roll_3_after_strike_or_spare(0)
      expect(frame.pins_3).to eq 0
    end
  end

  context "#roll_3" do
    it "sets @pins_3 to the number of pins knocked down" do
      frame.roll_1(0)
      frame.roll_2(2)
      frame.roll_3(7)
      expect(frame.pins_3).to eq 7
    end

    it "sets @pins_3 to maximum possible if the total number of pins knocked down is greater than 10" do
      frame.roll_1(0)
      frame.roll_2(7)
      frame.roll_3(7)
      expect(frame.pins_3).to eq(3)
    end
  end
end