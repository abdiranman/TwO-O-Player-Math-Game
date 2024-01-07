# game.rb
require_relative 'player'
require_relative 'question'

class Game
  attr_reader :current_player

  def initialize(player1_name, player2_name)
    @player1 = Player.new(player1_name)
    @player2 = Player.new(player2_name)
    @current_player = @player1
    @game_over = false
  end

  def switch_player
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end

  def generate_question
    Question.new
  end

  def evaluate_answer(question, answer)
    correct = question.check_answer(answer)
    @current_player.decrement_lives unless correct
    correct
  end

  def display_scores
    puts "#{@player1.name}: #{@player1.lives} lives | #{@player2.name}: #{@player2.lives} lives"
  end

  def game_over?
    @player1.lives.zero? || @player2.lives.zero?
  end

  def announce_winner
    winner = (@player1.lives.zero? ? @player2 : @player1)
    puts "#{winner.name} wins with #{winner.lives} lives remaining!"
  end

  def play
    until game_over?
      question = generate_question
      puts "#{current_player.name}'s turn:"
      puts "Question: #{question.to_s}"
      answer = gets.chomp.to_i
      correct = evaluate_answer(question, answer)
      display_scores
      switch_player
      puts correct ? "Correct!\n\n" : "Incorrect. Lose a life!\n\n"
    end
    announce_winner
  end
end
