# frozen_string_literal :true

require './lib/Tic_Tac_Toe.rb'

describe Game do
  describe '#clear_board' do
    it 'clears the board array' do
      ttt = Game.new('Henry', 'Sarah')
      expect(ttt.clear_board).to eql(['', '', '', '', '', '', '', '', ''])
    end
  end
end