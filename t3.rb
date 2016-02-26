require "pry"

# DATA IN THE SYSTEM
# * board
# * player1 (name/piece), player2
# * win conditions
# * current_player


# * start game



board = [8,1,6,3,5,7,4,9,2]

def show_board(board)
	3.times do |row|
		puts board[row * 3, 3].join(" | ")
	end
end

show_board(board)

