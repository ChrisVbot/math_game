require_relative 'twoop'
require 'colorize'

class Game
  
  #Gets user names, instantiates two Player classes and invokes run method on line 57 to start game. 
  def get_names
  puts "Player 1: Enter your name."
  input = gets.strip
  @player1 = Player.new(input)
  puts "Player 2: Enter your name."
  input = gets.strip
  @player2 = Player.new(input)
  run
  end
  
  #Generates the math question and prompts user for input
  def ask_question(player)
  @question1 = rand(20)
  @question2 = rand(20)
  puts "What is #{@question1} + #{@question2}?"
  puts "Enter your answer #{player.name}"
  @input = gets.chomp.to_i
  return (@input == (@question1 + @question2))
  end

  #Awards a point when player answers correctly and stores result.
  def correct_answer
  @current_player.gain
  puts "Correct! You got a point and you live to play another round. #{@current_player.name}'s points are now #{@current_player.lives}.".green
  end

#Deducts a point when player answers incorrectly and stores result. Runs game_over method if score reaches 0. 
  def incorrect_answer
  @current_player.lose
  puts "Incorrect! #{@current_player.name} answered #{@input} but the answer was #{@question1 + @question2}. #{@current_player.name}'s score is now #{@current_player.lives}".red 
  if @current_player.lives == 0
    game_over
    end
  end

#Adds to total number of losses. Runs when player's score reaches 0 and prompts user to replay or exit. When restarting, resets each player's points to 3. 
  def game_over
    puts "#{@current_player.name} loses. #{@current_player.name} has now lost a total of #{@current_player.total_losses} times! LOL! The final score is: #{@player1.name}: #{@player1.lives} points to #{@player2.name}: #{@player2.lives} points. Better luck next time, #{@current_player.name}! Type 'play' to play again or 'exit' to quit.".yellow
  input = gets.chomp
  case input
    when 'play'
      @player1.lives= 3
      @player2.lives= 3
      run     
    else 
      exit
    end
  end
  
  #Runs the logic of the program by checking the result of the ask_question function and comparing scores.
  def run
    @current_player = @player1
    while @player1.lives >= 1 && @player2.lives >= 1
      if !ask_question(@current_player)
        incorrect_answer
      else
        correct_answer
      end
      if @current_player == @player2
        @current_player = @player1
      else @current_player = @player2
      end
    end
  end
end

#Instantiates class and runs program. 
Game.new.get_names
