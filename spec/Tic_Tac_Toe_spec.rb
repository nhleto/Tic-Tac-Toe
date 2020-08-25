# frozen_string_literal :true

require './lib/Tic_Tac_Toe.rb'

describe Game do
  subject(:game) { Game.new('Henry', 'Sarah') }
  describe '#clear_board' do
    it 'clears the board array' do
      expect(game.clear_board).to eql(['', '', '', '', '', '', '', '', ''])
    end
  end

  describe '#position_taken' do
    context 'if player selects taken space' do
      let(:move) { move = 1 }
      subject(:board) { Board.new }

      before do
        board.game_board = ['X', '', '', '', '', '', '', '', '']
      end

      it 'returns error message' do

        error_message = 'That space is taken. Please guess again.'

        expect { game.position_taken[move] }.to output(error_message).to_stdout
      end
    end
  end
end
