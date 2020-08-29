# frozen_string_literal: true

# intro text heredoc
class StringDoc
  def intro_text
    puts <<-HEREDOC
                        The board is seperated into nine quarants:


      Top-Left=0, Top-Middle=1, Top-Right=2, Middle-Left=3, Middle-Mid...etc.


                          Standard Tic-Tac-Toe rules apply.
    HEREDOC
  end
end

# creation of display
class Board
  attr_accessor :game_board
  def initialize
    @game_board = ['', '', '', '', '', '', '', '', '']
  end

  def winning_combos
    [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
      [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
    ]
  end

  def x_winner?
    winning_combos.any? { |x| game_board.values_at(x[0], x[1], x[2]).all?('X') }
  end

  def o_winner?
    winning_combos.any? { |x| game_board.values_at(x[0], x[1], x[2]).all?('O') }
  end

  def place_x_o(index, turn)
    game_board[index] = turn
  end

  def valid_move?(move)
    move.between?(0, 9) && open_position?(move) == false
  end

  def open_position?(move)
    game_board[move].to_s.match?(/[XO]/)
  end

  def clear_board
    new_board = game_board.clear
    9.times do
      new_board << ''
    end
    new_board
  end

  def board_full?
    return false unless game_board.all?(/[A-Z]/)

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

# creation of game
class Game
  attr_accessor :board, :move
  attr_reader :attempts, :intro, :answer
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @intro = StringDoc.new
    @board = Board.new
    @turn = 'X'
    @answer = nil
    @move = move
  end

  def start_game
    intro.intro_text
    p1_move
  end

  def p1_move
    board.show_board
    win_cons
    puts "\n\n\nX, make your move".center(80)
    get_guess
    spot_taken_p1(@move)
    p2_move
  end

  def p2_move
    board.show_board
    win_cons
    puts "\n\n\nO, make your move".center(80)
    get_guess
    spot_taken_p2(@move)
    p1_move
  end

  def spot_taken_p1(move)
    if board.valid_move?(move)
      board.place_x_o(move, 'X')
    else
      puts 'Sorry, that spot is taken. Please guess again.'
      p1_move
    end
  end

  def spot_taken_p2(move)
    if board.valid_move?(move)
      board.place_x_o(move, 'O')
    else
      puts 'Sorry, that spot is taken. Please guess again.'
      p2_move
    end
  end

  def get_guess(default_input = gets.chomp)
    @move = Integer(default_input) rescue false
    return @move if @move

    puts 'Please enter an Integer.'
    get_guess
  end

  def replay_text
    puts 'Would you like to play again? Y/N'.center(80)
    @answer = gets.chomp.to_s.upcase until @answer == 'Y' || @answer == 'N'
  end

  def reset_answer
    @answer = nil
  end

  def replay
    replay_text
    if @answer == 'Y'
      board.clear_board
      system('clear')
      start_game
    else
      puts "\nCya".center(80)
      exit
    end
  end

  def cats_game?
    return false unless board.board_full? == true

    true
  end

  def win_cons
    if board.x_winner?
      puts "#{@player1} is the WINNER!".center(80)
      reset_answer
      replay
    elsif board.o_winner?
      puts "#{@player2} is the WINNER!".center(80)
      reset_answer
      replay
    elsif cats_game?
      puts "Cat's Game!"
      replay
    end
  end
end

ttt = Game.new('Henry', 'Sarah')
ttt.start_game
