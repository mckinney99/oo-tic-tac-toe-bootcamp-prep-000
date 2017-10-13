class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    display_board
  end

  def display_board
    puts " #{@board[0]}" " |" " #{@board[1]}" " |" " #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]}" " |" " #{@board[4]}" " |" " #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]}" " |" " #{@board[7]}" " |" " #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player)
    @board[index] = current_player
  end

    def position_taken?(index)
    !@board[index].nil? || @board[position] == " " || @board[position] == "" 
      return false
    else
      return true
  end
end

def valid_move?(position)
  if position_taken(position) == true || position.between?(0,8) == false
    return false
  else
    return true
  end
end

def turn_count
  counter = 0
  @board.each do |player|
    if player == "X" || player = "O"
      counter += 1
    end
  end
  counter
end

def current_player
  turn = turn_count
  if turn.even?
    return "X"
  else
    return "O"
  end
end

def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  position = input_to_index(user_input)
  if valid_move?(position)
  move(position, current_player)
  display_board
else turn
end
end

def won?
  wins_combo = false
  if @board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    return false
  else

    WIN_COMBINATIONS.each do |wins|
      char1 = "X"
      char2 = "O"
      if @board[wins[0]] == char1 && @board[wins[1]] == char1 && @board[wins[2]] == char1 || @board[wins[0]] == char2
        wins_combo = wins
      end
    end
    wins_combo
  end
end

def full?
  @board.non?{|spaces| spaces == " "}
end

def draw?
  if full? == true && won? == false
    return true
  end
end

def over?
  if draw?
    return true
  elsif full?
    return true
  elsif won?
    return true
  else
    false
  end
end

def winner
        win_combo = won?
        if win_combo
          index = win_combo[0]
          return @board[index]
        else
          return nil
        end
    end
      def play
        until over?
          turn
        end
        if won?
          puts "Congratulations #{winner}!"
        else draw?
          puts "Cat's Game!"
        end
    end
end
