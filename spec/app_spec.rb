require_relative '../app'
require 'game'
require 'frame'

RSpec.describe Application do

  let(:io) { double(:io) }
  let(:app) { Application.new(io) }
  let(:game) { Game.new }
  let(:frame) { Frame.new }

  describe "#roll" do
    context "when given a valid input" do
      it "returns the number of pins knocked over for roll 1" do
        allow(io).to receive(:puts).with('Frame 1 roll 1 pins knocked over: ')
        allow(io).to receive(:gets).and_return("5\n")
        expect(app.roll(1)).to eq(5)
      end

      it "returns the number of pins knocked over for roll 1" do
        allow(io).to receive(:puts).with('Frame 1 roll 1 pins knocked over: ')
        allow(io).to receive(:gets).and_return("5\n")
        expect(app.roll(1)).to eq(5)
        allow(io).to receive(:puts).with('Frame 1 roll 2 pins knocked over: ')
        allow(io).to receive(:gets).and_return("4\n")
        expect(app.roll(2)).to eq(4)
      end
    end
  end
end

