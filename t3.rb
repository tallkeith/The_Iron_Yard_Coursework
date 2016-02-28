require "pry"

# DATA IN THE SYSTEM
# * board
# * player1 (name/piece), player2
# * win conditions
# * current_player
# * player score

# * selection
# * start game

MAX_TURNS = 9
board = [8,1,6,3,5,7,4,9,2]


def show_board(board)
	3.times do |row|
		puts board[row * 3, 3].join(" | ")
	end
end

def win?(player_score, comp_score)

	if player_score.reduce(:+) == 15
		puts "Congratulations, you win!"
	elsif comp_score.reduce(:+) == 15
		puts "Sorry, you lost"
	elsif turn_count == MAX_TURNS
		puts "You tied!"
	else
		score(player_score)
	end
end

def score(player_score)
	
	puts "Please select a square 1-9"
	choice = gets.chomp.to_i
	until (1..9).include?(choice) && !player_score.include?(choice)
		if player_score.include?(choice)
			puts "That spot is already taken"
		end
		puts "Selection must be a number 1-9"
	end
	
	player_score.push(choice)
	choice
end

def current_player
	current_player = player
	if current_player == player
			current_player = comp
		else
			current_player = player
		end
end

def turn_count

end

def comp_move(board)	
	comp_piece = "O"
	spot = board.sample
	board[spot] = comp_piece
	show_board(board)
	if spot == (1..9)
		comp_piece
	else
		spot
	end
end

def icons(board, input)
	player_piece = "X"
	comp_piece = "O"
	spot = board.index(input)
	board[spot] = player_piece
	puts "Your move"
	show_board(board)
	puts "Computer's move"
	comp_move(board)
end

def play_game(board)
	player_score = []
	comp_score = []
	show_board(board)
	move = score(player_score)
	icons(board, move)
	win?(player_score, comp_score)
end

play_game(board)

