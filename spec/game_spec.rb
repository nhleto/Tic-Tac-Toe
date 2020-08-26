# frozen_string_literal: true

require './lib/Tic_Tac_Toe.rb'

describe Game do
  subject(:game) { described_class.new('Henry', 'Sarah') }
  describe '#get_guess' do
    context 'when user input is not an integer' do
      move = 'h'
      move2 = "0\n"
      before do
        allow(game).to receive(:gets).and_return(move, move2)
      end
      it 'prompts you to ask input integer' do
        expect(game).to receive(:puts).twice.with('Please enter an Integer.')
        expect(game.get_guess(move)).to eq(0)
      end
    end

    context 'when user input is an integer' do
      move = "0\n"
      before do
        allow(game).to receive(:gets).and_return(move)
      end

      it 'accepts input' do
        expect(game.get_guess(move)).to eq(0)
      end
    end
  end
  describe '#p1_move' do
    context 'when selected position is available' do
      move = '3'

      before do
        allow(game).to receive(:gets).and_return(move)
        allow(game).to receive(:p2_move)
        allow_any_instance_of(Board).to receive(:show_board)
        allow(game).to receive(:puts)
      end

      it 'mark spot on game_board' do
        expect(game.board).to receive(:place_x_o).with(move.to_i, 'X')
        game.p1_move
      end
    end
    # context 'when selected position is not available' do
    #   move = '1'
    #   before do
    #     allow(game).to receive(:gets).and_return(move)
    #     allow(game).to receive(:p2_move)
    #     allow_any_instance_of(Board).to receive(:show_board)
    #     allow(game).to receive(:puts)
    #   end
    #   it 'restarts turn' do
    #     expect(game.board).to receive(:valid_move?).once.and_return(false)
    #     game.p1_move
    #   end
    # end
  end
end
