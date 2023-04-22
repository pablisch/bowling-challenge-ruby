require_relative '../app'
require 'game'
require 'frame'

RSpec.describe Application do

  let(:io) { double(:io) }
  let(:app) { Application.new(io) }
  let(:game) { Game.new(io) }
  let(:frame) { Frame.new(io) }

  context "App #pin_1" do
    it "user inputs the number of pins hit" do
      expect(io).to receive(:puts).with("Enter number of pins knocked down for roll 1: ")
      expect(io).to receive(:gets).and_return("5").ordered
      app.roll(1)
    end
  end
end