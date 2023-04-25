require 'score'
require 'frame'

RSpec.describe Score do

  let(:score) { Score.new }

  # context "#strike" do
  #   it "" do
  #     game.run
  #     expect(@new_frame).to eq false
  #   end
  # end


  describe '#strike' do
    it 'should correctly calculate score after a strike' do
      frame_1 = double(Frame)
      expect(frame_1).to receive(:roll_1).with(5)
      score = Score.new(frames)
      score.strike(0)
      expect(score.score).to eq(27)
    end

    xit 'should correctly calculate score after a strike on the last frame' do
      frames = [Frame.new(0, 0), Frame.new(0, 0), Frame.new(0, 0), Frame.new(0, 0), Frame.new(0, 0), Frame.new(0, 0), Frame.new(0, 0), Frame.new(0, 0), Frame.new(0, 0), Frame.new(10, 10, 10)]
      score = Score.new(frames)
      score.strike(9)
      expect(score.score).to eq(30)
    end

    xit 'should correctly calculate score after a strike followed by a spare' do
      frames = [Frame.new(10, 0), Frame.new(5, 5), Frame.new(2, 6)]
      score = Score.new(frames)
      score.strike(0)
      expect(score.score).to eq(32)
    end

    xit 'should correctly calculate score after two strikes in a row' do
      frames = [Frame.new(10, 0), Frame.new(10, 0), Frame.new(2, 6)]
      score = Score.new(frames)
      score.strike(0)
      score.strike(1)
      expect(score.score).to eq(42)
    end
  end
end
