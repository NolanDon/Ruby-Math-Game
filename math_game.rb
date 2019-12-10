require './questions.rb'
require './players.rb'

class MathGame

  def initialize
    sleep(1)
    puts "--------- WELCOME TO THE MATH GAME -----------"
    sleep(1)
    puts "---- Player 1: Please enter your username ----"
    @player1 = Players.new($stdin.gets.chomp)
    # sleep(0.5)
    puts "Welcome '#{@player1.name}' you are Player1"
    puts "----------------------------------------------"
    puts "---- Player 2: Please enter your username ----"
    @player2 = Players.new($stdin.gets.chomp)
    # sleep(0.5)
    puts "Welcome '#{@player2.name}' you are Player2"
    puts "----------------------------------------------"
    sleep(0.5)
    puts "----------------------------------------------"
    puts "#{@player1.name} lives left: #{@player1.life}"
    puts "#{@player2.name} lives left: #{@player2.life}"
    puts "----------------------------------------------"

    puts "Ready to begin? type enter when both players are ready"
  
    start_game = $stdin.gets.chomp
    if start_game == "enter" 
      sleep(0.7)
      puts "3.."
      sleep(0.7)
      puts "2.."
      sleep(0.7)
      puts "1.."
      sleep(0.7)
      puts "go!"
    end
  end

  def turn
    question
    check_answer
  end

  def question
    question = Question.new
    @query = question.question
    @answer = question.answer
    sleep(1)
    puts "-------------------------------------------- "
    puts '----------------- NEW ROUND ------------------'
    
    if @player1.turn
      sleep(1)
      puts "Your turn is up: #{@player1.name}"
      puts "#{@query}"
    else
      sleep(1)
      puts "Your turn is up: #{@player2.name}"
      puts "#{@query}"
    end
  end
      
  def check_answer
    if $stdin.gets.chomp.to_i == @answer
      if @player1.turn
        puts 'You answered correctly!'
        puts "-------------------------------------------- "
        @player1.turn = false
        @player2.turn = true
        score?
        win?
      else
       
        puts 'You are correct!'
        @player1.turn = true
        @player2.turn = false
        score?
        win?      
      end
    else
      if @player1.turn
        @player1.life -= 1
        puts "----------------------------------------------"
        puts "#{@player1.name} HAD THE WRONG ANSWER"
        puts "----------------------------------------------"
        @player1.turn = false
        @player2.turn = true
        sleep(1)
        puts "The corrent answer was #{@answer}."
        score?
        win?
      else
        @player2.life -= 1
        puts "#{@player2.name}: WRONG!"
        @player1.turn = true
        @player2.turn = false
        sleep(1)
        puts "The corrent answer was #{@answer}."
        score?
        win?
      end
    end 
  end

  def score?
    puts "#{@player1.name} lives left: #{@player1.life}"
    puts "#{@player2.name} lives left: #{@player2.life}"
    if @player1.life == 1
      puts "#{@player1.name} has only 1 life left!"
    elsif @player2.life == 1
      puts "#{@player2.name} has only 1 life left!"
    end
    puts "----------------------------------------------"
  end                                                   
  
  def win?
    if @player1.life <= 0
      puts "GAME OVER! #{@player2.name} HAS WON WITH #{@player2.life} LIVES LEFT"
    elsif @player2.life <= 0
      puts "GAME OVER! #{@player1.name} HAS WON WITH #{@player1.life} LIVES LEFT"
    else
    turn
  end 
end
end

















# def initialize
#   puts 'Welcome to Math Game'
#   sleep(1)
#   puts 'Please enter your name, PLAYER 1:'
#   name1 = gets.chomp
#   @player1 = Players.new(gets.chomp)
#   puts 'Please enter your name, PLAYER 2:'
#   name2 = gets.chomp
#   @player2 = Players.new(gets.chomp)
#   sleep(1)
#   puts "Okay, #{@player1.name} and #{@player2.name}...."
#   puts 'Let us begin...'
# end



  #   if bear == "1"
  #   puts "The bear eats your face off. Good job!"
  # elsif bear == "2"
  #   puts "The bear eats your legs off. Good job!"
  # else
  #   puts "Well, doing %s is probably better. Bear runs away." %bear
  # end
  
  # elsif door == "2"
  #   puts "You stare into the endless abyss at Cthulhu's retina."
  #   puts "1. Blueberries."
  #   puts "2. Yellow jacket clothespins."
  #   puts "3. Understanding revolvers yelling melodies."
  
  #   print "> "
  #   insanity = $stdin.gets.chomp
  
  # if insanity == "1" || insanity == "2"
  #   puts "Your body survives powered by a mind of jello.  Good job!"
  # else
  #   puts "The insanity rots your eyes into a pool of muck.  Good job!"
  # end
  
  # else
  #   puts "You stumble around and fall on a knife and die.  Good job!"
  # end
  



