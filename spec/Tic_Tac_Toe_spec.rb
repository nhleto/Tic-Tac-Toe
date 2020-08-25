# frozen_string_literal :true

require './lib/Tic_Tac_Toe.rb'

describe Board do
  subject(:board) { described_class.new }
  describe '#x_winner? true' do
    context 'when X win con is horizontal' do
      before do
        board.game_board = %w[X X X O O O O O O]
      end
      it 'returns true' do
        expect(board.x_winner?).to be(true)
      end
    end

    context 'when X win con is diagonal' do
      before do
        board.game_board = %w[O O O X X X O O O]
      end

      it 'returns true' do
        expect(board.x_winner?).to be(true)
      end
    end

    context 'when X win con is vertical' do
      before do
        board.game_board = %w[O X O O X O O X O]
      end
      it 'returns true' do
        expect(board.x_winner?).to be(true)
      end
    end
  end
end

describe Board do
  subject(:board) { described_class.new }
  describe '#x_winner false' do

    context 'when no X win con' do
      before do
        board.game_board = %w[O O O O O O O O O]
      end

      it 'returns false' do
        expect(board.x_winner?).to be(false)
      end
    end
    context 'when false X win con' do
      before do
        board.game_board = %w[O X X X O O O O O]
      end
      it 'returns false' do
        expect(board.x_winner?).to be(false)
      end
    end
  end
end

describe Board do
  subject(:board) { described_class.new }
  describe '#o_winner false' do
      context 'when O win con is horizontal' do
        before do
          board.game_board = %w[O O O X X X X X X]
        end
        it 'returns true' do
          expect(board.o_winner?).to be(true)
        end
      end
  
      context 'when O win con is diagonal' do
        before do
          board.game_board = %w[X X X O O O X X X]
        end
        it 'returns true' do
          expect(board.o_winner?).to be(true)
        end
      end
  
      context 'when O win con is vertical' do
        before do
          board.game_board = %w[X O X X O X X O X]
        end
        it 'returns true' do
          expect(board.o_winner?).to be(true)
        end
      end
    end
  end

describe Board do
  subject(:board) { described_class.new }
  describe '#o_winner false' do

    context 'when no O win con' do
      before do
        board.game_board = %w[X X X X X X X X X]
      end

      it 'returns false' do
        expect(board.o_winner?).to be(false)
      end
    end
    context 'when false O win con' do
      before do
        board.game_board = %w[X O O O X X X X X X]
      end
      it 'returns false' do
        expect(board.o_winner?).to be(false)
      end
    end
  end
end
  
describe Board do
  subject(:board) { described_class.new }
  describe '#open_position?' do
    context 'when position is taken' do
      before do
        board.game_board = ['X', '', '', '', '', '', '', '', '']
      end
      it 'returns false' do
        @move = 0
        expect(board.open_position?(@move)).to be(true)
      end
    end
  end
  describe '#valid_move?' do
    context 'when position is not taken and input correct' do
      before do
        board.game_board = ['X', '', '', '', '', '', '', '', '']
      end
      it 'returns true' do
        @move = 1
        expect(board.valid_move?(@move)).to be(true)
      end
    end
    context 'when position is not taken but input incorrect' do
      before do
        board.game_board = ['X', '', '', '', '', '', '', '', '']
      end
      it 'returns false' do
        @move = 6
        expect(board.valid_move?(@move)).to be(false)
      end
    end
  end
end

# describe Game do
#   subject(:game) { Game.new('Henry', 'Sarah') }
#   describe '#clear_board' do
#     it 'clears the board array' do
#       expect(game.clear_board).to eql(['', '', '', '', '', '', '', '', ''])
#     end
#   end

#   describe '#position_taken' do
#     context 'if player selects taken space' do
#       let(:move) { move = 1 }
#       subject(:board) { Board.new }

#       before do
#         board.game_board = ['X', '', '', '', '', '', '', '', '']
#       end

#       it 'returns error message' do

#         error_message = 'That space is taken. Please guess again.'

#         expect { game.position_taken[move] }.to output(error_message).to_stdout
#       end
#     end
#   end
# end
