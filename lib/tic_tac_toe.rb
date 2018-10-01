class TicTacToe 
  def initialize (board = nil)
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  WIN_COMBINATIONS = [
  [0,1,2],  #top_row_win [X,X,X,a,a,a,a,a,a]
  [3,4,5], #center_row_win [a,a,a,X,X,X,a,a,a]
  [6,7,8], #bottom_row_win [a,a,a,a,a,a,O,O,O]
  [0,3,6], #left_column_win [O,a,a,O,a,a,O,a,a]
  [1,4,7], #center_column_win [a,O,a,a,O,a,a,O,a]
  [2,5,8], #right_column_win [a,a,X,a,a,X,a,a,X]
  [0,4,8], #left_diagonal_win [X,a,a,a,X,a,a,a,X]
  [2,4,6] #right_diagonal_win [a,a,O,a,O,a,O,a,a]
]

  def display_board
   print " #{@board [0]} ", "|", " #{@board [1]} ", "|", " #{@board [2]} "
   puts "\n"
   print "-----------"
   puts "\n"
   print " #{@board [3]} ", "|", " #{@board [4]} ", "|", " #{@board [5]} "
   puts "\n"
   print "-----------"
   puts "\n"
   print " #{@board [6]} ", "|", " #{@board [7]} ", "|", " #{@board [8]} "
   puts "\n"
  end 

  def input_to_index(user_input)
    user_input.to_i - 1 
  end
  
  def move(index,token="X")
    @board[index]= token
    return @board 
  end 
  
  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn_count
    counter= 0 
   @board.each do|position|
      if (position=="X") 
        counter+= 1 
      elsif (position== "O")
        counter+= 1 
      end 
   end 
   return counter
  end 

  def current_player
    if (turn_count % 2 == 0)
      return "X"
    else 
      return "O"
    end 
  end 

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index=input_to_index(user_input)
    if valid_move?(index)
     token = current_player
     move(index, token)
     display_board
    else
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.any? do |win_combination|
     if @board[win_combination[0]]=="X"&&
       @board[win_combination[1]]=="X"&&
       @board[win_combination[2]]=="X"
       return win_combination
     elsif @board[win_combination[0]]=="O"&&
       @board[win_combination[1]]=="O" &&
       @board[win_combination[2]]=="O"
       return win_combination
     end
   end
  end 
 

  def full?
    if @board.include? " " || nil
      return false
    else 
      return true 
    end 
  end


  def draw?
    if full? && !won?
      return true
    else 
      return false
    end
  end 

  def over?
    if won? || draw? || full?
      return true
    else
      return false
    end 
  end 

  def winner
    if won?
      WIN_COMBINATIONS.each do |win_combination|
        if @board[win_combination[0]]=="X"&&
         @board[win_combination[1]]=="X"&&
         @board[win_combination[2]]=="X"
         return "X"
        elsif @board[win_combination[0]]=="O"&&
          @board[win_combination[1]]=="O" &&
          @board[win_combination[2]]=="O"
          return "O"
        end
      end  
   else 
     return nil 
   end
 end
 
 def play
  until over? 
    turn
  end 
    if won? && winner== "X"
      puts "Congratulations X!"
    elsif won? && winner== "O"
      puts "Congratulations O!"
    elsif draw?
      puts "Cat's Game!"
    end 
 end
end 