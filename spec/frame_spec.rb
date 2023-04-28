require 'frame'

RSpec.describe Frame do

  let(:frame) { Frame.new }

  context "#add_roll" do
    it "adds one score to @frame_points when given 7" do
      frame.add_roll(7)
      expect(frame.length).to eq 1
    end

    it "adds 7 to @frame_points when given 7" do
      frame.add_roll(7)
      expect(frame.frame_points).to eq [7]
    end

    it "adds 7 and 2 to @frame_points when given 7 and 2" do
      frame.add_roll(7)
      frame.add_roll(2)
      expect(frame.frame_points).to eq [7, 2]
    end

    it "adds 10, 6 and 2 to @frame_points when given 10, 6 and 2" do
      frame.add_roll(10)
      frame.add_roll(6)
      frame.add_roll(2)
      expect(frame.frame_points).to eq [10, 6, 2]
    end
  end

  context "#strike?" do
    it "returns true when first roll is 10" do
      frame.add_roll(10)
      frame.add_roll(6)
      expect(frame.strike?).to eq true
    end

    it "returns false when first roll is 0" do
      frame.add_roll(0)
      frame.add_roll(6)
      expect(frame.strike?).to eq false
    end

    it "returns false when there are no rolls" do
      expect(frame.strike?).to eq false
    end
  end

  context "#spare?" do
    it "returns true when first roll is not 10 but the first two rolls have a sum of 10" do
      frame.add_roll(4)
      frame.add_roll(6)
      expect(frame.spare?).to eq true
    end

    it "returns true when first roll is 0 and the second roll is 10" do
      frame.add_roll(0)
      frame.add_roll(10)
      expect(frame.spare?).to eq true
    end

    it "returns false when first roll is 10 and the first two rolls have a sum of 10" do
      frame.add_roll(10)
      frame.add_roll(0)
      expect(frame.spare?).to eq false
    end

    it "returns false when rolls do not have a sum of 10" do
      frame.add_roll(1)
      frame.add_roll(8)
      expect(frame.spare?).to eq false
    end
  end

  context "#length" do
    it "returns 1 after 1 roll is added" do
      frame.add_roll(4)
      expect(frame.length).to eq 1
    end

    it "returns 2 after 2 rolls are added" do
      frame.add_roll(4)
      frame.add_roll(6)
      expect(frame.length).to eq 2
    end

    it "returns 3 after 3 rolls are added" do
      frame.add_roll(4)
      frame.add_roll(6)
      frame.add_roll(6)
      expect(frame.length).to eq 3
    end
  end

end