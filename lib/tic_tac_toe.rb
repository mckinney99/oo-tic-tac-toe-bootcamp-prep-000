class TicTacToe
  def initialize
    @board = [" "," "," "," "," "," "," "," "," ",]
    display_board
  end

  def display_board
    puts " #{@board[0]} " + "|" + " #{@board[1]} " + "|" +" #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} " + "|" + " #{@board[4]} " + "|" +" #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} " + "|" + " #{@board[7]} " + "|" +" #{@board[8]} "
  end
  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def turn_count
    counter = 0
    @board.each do |square|
      if square == "X" || square == "O"
        counter += 1
      end
    end
    return counter
  end

  def current_player
    total_turns = turn_count
    if total_turns % 2 == 0
      return "X"
    else
      return "O"
    end
  end
  WIN_COMBINATIONS = [
    [0,1,2],
    [0,3,6],
    [0,4,8],
    [1,4,7],
    [2,5,8],
    [3,4,5],
    [6,7,8],
    [6,4,2]
  ]

def won?
  WIN_COMBINATIONS.detect do |winning_array|
  win1 = winning_array[0]
  win2 = winning_array[1]
  win3 = winning_array[2]
  if @board[win1] == "X" && @board[win2] == "X" && @board[win3] == "X"
    true
  elsif @board[win1] == "O" && @board[win2] == "O" && @board[win3] == "O"
    true
  else false
  end
end
end

def full?
  full = @board.all? do |index|
    index == "X" || index == "O"
  end
  return full
end

def over?
  if won? != nil || draw? == true
    return true
  else
    return false
  end
end

def draw?
  full = full?
  won = won?
  if full == false
    return false
  elsif full == true && won != nil
    return false
  else
    return true
  end
end

def winner
  win = won?
  if win != nil
    return @board[win[0]]
  else
    return nil
  end
end



def input_to_index(user_input)
  user_input.to_i - 1
end


def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    token = current_player
    move(index, token)
    display_board
  else
    turn
  end
end

def play
  until over? == true
    turn
  end
  if won?
    hero = winner
    puts "Congratulations #{hero}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end
