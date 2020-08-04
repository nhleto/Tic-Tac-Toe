class Board
  attr_accessor :game_board
  
  def initialize
      @game_board=[ "", "", "", "", "", "", "", "", ""]
  end

  def show_board
      puts game_board[0] + " | " + game_board[1] + "|" + game_board[2] + " "
      puts '-+-+-'
      puts game_board[3]+ " | " +game_board[4] + "|" + game_board[5] + " "
      puts '-+-+-'
      puts game_board[6] + " | " + game_board[7] + "|" + game_board[8] + " "
  end
end

class Game
  attr_accessor :board

  def initialize(player1, player2)
    @player1=player1
    @player2=player2
    @board = Board.new
    puts "The board is seperate into nine quarants: Top-Left=0, Top-Middle=1, Top-Right=2, Middle-Left=3, Middle-Mid...etc. Standard Tic-Tac-Toe rules.\n\n\n"
  end

  def play_game
    board.show_board
    player_move()
    winner()
  end

  def player_move
    turn='X'
    9.times do
      puts "\n\n\n#{turn}, make your move"
      move=gets.chomp.to_i
      board.game_board[move]=turn
      board.show_board
      if turn=='X'
        turn='O'
      else
        turn='X'
      end
    end
  end

  def repeat_check

  end

  def winner
    puts "\n\n" 
    board.show_board
    puts "And the winner is..."
      if board.game_board[0] == board.game_board[1] && board.game_board[0] == board.game_board[2] && board.game_board[0] == 'X'
        puts "#{@player1}"
      else if board.game_board[0] == board.game_board[1] && board.game_board[0] == board.game_board[2] && board.game_board[0] == 'O'
        puts "#{@player2}"
      else
        puts "Cats game"
      end
    end
  end
end


tic_tac_toe=Game.new('Henry', 'Sarah')
tic_tac_toe.play_game

