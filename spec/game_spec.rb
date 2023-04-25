require 'game'

RSpec.describe Game do

  let(:game) { Game.new }

  context "#run" do
    it "" do
      game.run
      expect(@new_frame).to eq false
    end
  end
end