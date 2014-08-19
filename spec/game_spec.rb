require 'spec_helper'
require 'game'

describe Game do
  let(:output) { double('output').as_null_object }
  let(:game) { Game.new(output) }
  describe "#guess" do
    context "with no matches" do
      it "sends a mark with ''" do
        game.start('1234')
        expect(output).to receive(:puts).with('')
        game.guess('5555')
      end
    end

    context 'with partial match and same numbers' do
      it "sends the mark with '++'" do
        game.start('1234')
        expect(output).to receive(:puts).with('++')
        game.guess('1739')
      end
    end

    context 'with partial match' do
      it "sends the mark with '++--'" do
        game.start('1234')
        expect(output).to receive(:puts).with('++--')
        game.guess('1333')
      end
    end

    context 'with full match'
    it "sends the mark with '++++'" do
      game.start('1234')
      expect(output).to receive(:puts).with('++++')
      game.guess('1234')
    end
  end

  describe "#start" do
    it "sends a welcome message" do
      expect(output).to receive(:puts).with('Welcome to Codebreaker!')
      game.start('1234')
    end
    it "prompts for the first guess" do
      expect(output).to receive(:puts).with('Enter guess:')
      game.start('1234')
    end
  end
end