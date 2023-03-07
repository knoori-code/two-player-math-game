require './player.rb'
require './question.rb'
require 'active_support/all'

class MathGame
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current_player = @player1
    @game_over = false
  end

  def start_game
    while @game_over == false do
      question = Question.new
      puts "----- NEW TURN -----"
      puts "#{current_player.name}: What does #{question.num1} plus #{question.num2} equal?"
      answer = gets.chomp.to_i

      if answer == question.answer
        puts "#{current_player.name}: YES!  You are correct."
      else 
        puts "#{current_player.name}:  Seriously?  No!"
        current_player.lose_life
      end

      puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"

      if current_player == player1
        @current_player = @player2
      else
        @current_player = @player1
      end

      if player1.lives == 0 || player2.lives == 0
        @game_over = true
      end
    end

    end_game
  end

  def end_game
    if player1.lives == 0
      winner = player2
      loser = player1
    else
      winner = player1
      loser = player2
    end

    puts "----- GAME OVER -----"
    puts "#{loser.name} has no more lives. #{winner.name} wins with a score of #{winner.lives}/3"
  end

  attr_accessor :player1, :player2, :current_player
end


game = MathGame.new
game.start_game

