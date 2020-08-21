# frozen_string_literal: true

class StringDoc
  def here_doc
    puts <<-HEREDOC
                        The board is seperated into nine quarants:


      Top-Left=0, Top-Middle=1, Top-Right=2, Middle-Left=3, Middle-Mid...etc.


                          Standard Tic-Tac-Toe rules apply.
    HEREDOC
  end
end


# creating of display
class Board
  attr_accessor :game_board, :move
  def initialize
    @game_board = ['', '', '', '', '', '', '', '', '']
    @move = move
  end

  def show_board
    puts "\n\n"
    puts " #{game_board[0]} | #{game_board[1]} | #{game_board[2]} ".center(80)
    puts '-----------'.center(80)
    puts " #{game_board[3]} | #{game_board[4]} | #{game_board[5]} ".center(80)
    puts '-----------'.center(80)
    puts " #{game_board[6]} | #{game_board[7]} | #{game_board[8]} ".center(80)
  end
end

# creating of game input
class Game
  attr_accessor :board
  attr_reader :attempts, :intro
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @intro = StringDoc.new
    @board = Board.new
    @turn = 'X'
  end

  def start_game
    intro.here_doc
    player_move
  end

  def player_move
    loop do
      board.show_board
      x_winner(board.game_board)
      o_winner(board.game_board)
      board_full(board.game_board)
      puts "\n\n\n#{@turn}, make your move".center(80)
      @move = gets.chomp.to_i
      position_taken(board.game_board, @move)
      board.game_board[@move] = @turn
      @turn == 'X' ? @turn = 'O' : @turn = 'X'
    end
  end

  def position_taken(board, index)
    return if board[index] == ''

    puts 'That space is taken. Please guess again.'
    player_move
  end
end

  def board_full(board)
    p board
    if board.all?((/[A-Z]/))
      puts "Cat's Game!"
      exit
    end
  end

  def clear_board(board)
    new_board = board.clear
    9.times do
      new_board << ''
    end
  end

  def replay
    puts 'Would you like to play again? Y/N'.center(80)
    answer = gets.chomp.upcase until answer == 'Y' || answer == 'N'

    if answer == 'Y'
      clear_board(board.game_board)
      start_game
    else
      puts "\nCya".center(80)
      exit
    end
  end

  def x_winner(board)
    if board[0] == board[1] && board[0] == board[2] && board[0] == 'X' ||
       board[3] == board[4] && board[3] == board[5] && board[3] == 'X' ||
       board[6] == board[7] && board[6] == board[8] && board[6] == 'X' ||
       board[0] == board[3] && board[0] == board[6] && board[0] == 'X' ||
       board[1] == board[4] && board[1] == board[7] && board[1] == 'X' ||
       board[2] == board[5] && board[2] == board[8] && board[2] == 'X' ||
       board[0] == board[4] && board[0] == board[8] && board[0] == 'X' ||
       board[2] == board[4] && board[2] == board[6] && board[2] == 'X'
      puts "#{@player1} is the WINNER!".center(80)
      replay
    end
  end

  def o_winner(board)
    if board[0] == board[1] && board[0] == board[2] && board[0] == 'O' ||
       board[3] == board[4] && board[3] == board[5] && board[3] == 'O' ||
       board[6] == board[7] && board[7] == board[8] && board[6] == 'O' ||
       board[0] == board[3] && board[0] == board[6] && board[0] == 'O' ||
       board[1] == board[4] && board[1] == board[7] && board[1] == 'O' ||
       board[2] == board[5] && board[2] == board[8] && board[2] == 'O' ||
       board[0] == board[4] && board[0] == board[8] && board[0] == 'O' ||
       board[2] == board[4] && board[2] == board[6] && board[2] == 'O'
      puts "#{@player2} is the WINNER!".center(80)
      replay
    end
  end
