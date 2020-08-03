# board=__|__|__
#       __|__|__ 
#         |  |


# top=[topL,| topM,| topR]
# mid=[midL, midM, midR]
# bot=[botL, botM, botR]

# top={topL: "_|", topM: "_|", topR: "_" }
# mid={midL: "_|", midM: "_|", midR: "_"}
# bot={botL: " |", botM: " |", botR: " "}

# top={topL: "_|", topM: "_|", topR: "_" }
# mid={midL: "_|", midM: "_|", midR: "_"}
# bot={botL: " |", botM: " |", botR: " "}
# print top[:topL], top[:topM]
# puts top[:topR]
# print mid[:midL], mid[:midM]
# puts mid[:midR]
# print bot[:botL], bot[:botM], bot[:botR]

# class TicTacToe
#   include Board
#   def initialize(player1, player2)
#     @player1=player1
#     @player2=player2
#     @board=board
#   end

#   def move
#     top[:topL]='X'
#   end
# end



def board
  top={topL: "_|", topM: "_|", topR: "_" }
  mid={midL: "_|", midM: "_|", midR: "_"}
  bot={botL: " |", botM: " |", botR: " "}
  print top[:topL], top[:topM]
  puts top[:topR]
  print mid[:midL], mid[:midM]
  puts mid[:midR]
  print bot[:botL], bot[:botM], bot[:botR]
  puts
end
