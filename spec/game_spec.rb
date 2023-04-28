require 'game'
require 'frame'
require 'score'

RSpec.describe Game do

  let(:game) { Game.new }
  let(:frame) { Frame.new }
  let(:score) { Score.new }

  context "#add_roll" do
    it "" do
      game.add_roll(3)
      game.add_roll(3)
      game.add_roll(3)
      p game.frames
      p frame.frame_points
      p frame.length
      expect(frame.length).to eq 1
    end
  end
end