# frozen_string_literal: true

require 'pry'
class StringDoc
  def intro_text
    puts <<-HEREDOC
                        The board is seperated into nine quarants:


      Top-Left=0, Top-Middle=1, Top-Right=2, Middle-Left=3, Middle-Mid...etc.


                          Standard Tic-Tac-Toe rules apply.
    HEREDOC
  end
end

# creating of display
class Board
  attr_accessor :game_board
  def initialize
    @game_board = ['', '', '', '', '', '', '', '', '']
  end

  def open_position?(position)
    game_board[position] == ''
  end

  def clear_board
    new_board = game_board.clear
    9.times do
      new_board << ''
    end
    new_board
  end

  def board_full?
    return unless game_board.all?(/[A-Z]/)

    true
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

# creation game input
class Game
  attr_accessor :board, :move
  attr_reader :attempts, :intro
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @intro = StringDoc.new
    @board = Board.new
    @turn = 'X'
    # @move = move
  end

  def start_game
    intro.intro_text
    player_move
  end

  def player_move
    loop do
      board.show_board
      p board.game_board
      win_cons
      puts "\n\n\n#{@turn}, make your move".center(80)
      @move = gets.chomp.to_i
      board.open_position?(@move)
      board.game_board[@move] = @turn
      @turn == 'X' ? @turn = 'O' : @turn = 'X'
    end
  end

  def replay
    puts 'Would you like to play again? Y/N'.center(80)
    answer = gets.chomp.upcase until answer == 'Y' || answer == 'N'

    if answer == 'Y'
      board.clear_board
      system('clear')
      start_game
    else
      puts "\nCya".center(80)
      exit
    end
  end

  def cats_game?
    if board.board_full? == true
      true
    end
  end

  def win_cons
    if x_winner?(board.game_board) == true
      puts "#{@player1} is the WINNER!".center(80)
      replay
    elsif o_winner?(board.game_board) == true
      puts "#{@player2} is the WINNER!".center(80)
      replay
    elsif cats_game? == true
      puts "Cat's Game!"
      replay
    end
  end

  def x_winner?(board)
    if board[0] == board[1] && board[0] == board[2] && board[0] == 'X' ||
       board[3] == board[4] && board[3] == board[5] && board[3] == 'X' ||
       board[6] == board[7] && board[6] == board[8] && board[6] == 'X' ||
       board[0] == board[3] && board[0] == board[6] && board[0] == 'X' ||
       board[1] == board[4] && board[1] == board[7] && board[1] == 'X' ||
       board[2] == board[5] && board[2] == board[8] && board[2] == 'X' ||
       board[0] == board[4] && board[0] == board[8] && board[0] == 'X' ||
       board[2] == board[4] && board[2] == board[6] && board[2] == 'X'
      true
    end
  end

  def o_winner?(board)
    if board[0] == board[1] && board[0] == board[2] && board[0] == 'O' ||
       board[3] == board[4] && board[3] == board[5] && board[3] == 'O' ||
       board[6] == board[7] && board[7] == board[8] && board[6] == 'O' ||
       board[0] == board[3] && board[0] == board[6] && board[0] == 'O' ||
       board[1] == board[4] && board[1] == board[7] && board[1] == 'O' ||
       board[2] == board[5] && board[2] == board[8] && board[2] == 'O' ||
       board[0] == board[4] && board[0] == board[8] && board[0] == 'O' ||
       board[2] == board[4] && board[2] == board[6] && board[2] == 'O'
      true
    end
  end
end

ttt = Game.new('Henry', 'Sarah')
ttt.player_move