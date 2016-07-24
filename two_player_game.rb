require 'colorize'
@player1 = {:name => "", :lives => 3}
@player2 = {:name => "", :lives => 3}

#Gets each player's name and saves the value in its respective hash.
def get_names
  puts "Player 1: Enter your name."
  input = gets.strip
  @player1[:name] = input
  puts "Player 2: Enter your name."
  input = gets.strip
  @player2[:name] = input
end

#Generates the math question for players
def ask_question(player)
  @question1 = rand(20)
  @question2 = rand(20)
  puts "What is #{@question1} + #{@question2}?"
  puts "Enter your answer #{player[:name]}"
  @input = gets.chomp.to_i
  return (@input == (@question1 + @question2))
end

#Informs player of an incorrect answer, shows the actual answer and displays score of current player. 
def incorrect_answer
  puts "Incorrect! #{@current_player[:name]} answered #{@input} but the answer was #{@question1 + @question2}. Your score is now #{@current_player[:lives]}".red 
end

#Runs when player answers correctly and shows current player's score. 
def correct_answer
  puts "Correct! You live to play another round. Your score is #{@current_player[:lives]}.".green
end

#Runs when score for a player reaches 0. Shows final score of both players. Resets score and runs again if players want to replay. 
def game_over
  puts "#{@current_player[:name]} loses. The final score is: #{@player1[:name]}: #{@player1[:lives]} points to #{@player2[:name]}: #{@player2[:lives]} points. Better luck next time, #{@current_player[:name]}! Type 'play' to play again or 'exit' to quit.".yellow
  input = gets.chomp
  case input
    when 'play'
      @player1[:lives]= 3
      @player2[:lives]= 3
      run     
    else 
      exit
  end
end

#Runs the program
def run
  @current_player = @player1
  while @player1[:lives] >= 0 && @player2[:lives] >= 0
    if @current_player[:lives] == 0
      game_over
    elsif !ask_question(@current_player)
      incorrect_answer
      @current_player[:lives] -= 1
    else
      correct_answer
    end
    if @current_player == @player2
      @current_player = @player1
    else @current_player = @player2
    end
  end
end

get_names
run


