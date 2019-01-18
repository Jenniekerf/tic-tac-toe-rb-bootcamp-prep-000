WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
  ]
  
  def play(board)
  turn(board) until over?(board)
  if won?(board)
   puts "Congratulations #{winner(board)}!"
   elsif draw?(board)
   puts "Cat's Game!"
end
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(board, position, player_token)
  board[position] = player_token
end

def position_taken?(board, position)
  board[position] == "X" || board[position] == "O" ? true : false
end

def valid_move?(board, position)
  board[position] == " " && position.between?(0, 8) 
end

def turn(board)
puts "Please enter a number 1-9:"
answer = gets.strip
player_token = "X" || "O"
position = input_to_index(answer)
if valid_move?(board, position)
  move(board, position, player_token)
  display_board(board)
else
turn(board)
end
end



def turn_count(board)
  board.count { |token| token == 'X' || token == 'O' }
end

def current_player(board)
  if turn_count(board) / 2 == 0 
    return "O"
  else 
    return "X"
  end
end

def won?(board)
  WIN_COMBINATIONS.find do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    board[combo[0]] != " "
end
end

def full?(board)
  board.all? do |index| 
  index == "X" || index == "O"
end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  won = won?(board)
  if won != nil
    board[won[0]]
  end
end




























