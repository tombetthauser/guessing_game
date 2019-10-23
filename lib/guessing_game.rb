require "byebug"

class GuessingGame

  attr_reader :num_attempts

  def initialize(min=nil, max=nil)
    @min = min || rand(100)
    @max = max
    @secret_num = nil
    @num_attempts = 0
    @game_over = false
    @user_name = nil
    @difficulty = nil
    @max_attempts = 5
    @winner = false
  end

  def game_over?
    @game_over
  end

  def new_game
    system "clear"

    
    print "---------------------------------------------\n"
    print "|                                           |\n"
    print "|    Welcome to Tom's Ruby Guessing Game    |\n"
    print "|                                           |\n"
    print "---------------------------------------------\n\n"
        
    print "Please enter your name: "
    `say "Welcome to Tom's Ruby Guessing Game, Please enter your name"`
    @user_name = gets.chomp.to_s

    
    print "Please enter a difficulty level: "
    @difficulty = gets.chomp.to_s
    until ["easy", "medium", "hard", "custom"].include?(@difficulty)
      print "Sorry, that is not a valid difficulty.\nPlease enter easy, medium or hard: "
      @difficulty = gets.chomp.to_s
    end
    
    if @difficulty == "custom"
      print "Please enter a minimum number: "
      @min = gets.chomp.to_i
      print "Please enter a maximum number: "
      @max = gets.chomp.to_i
      print "Please enter a maximum number of guesses: "
      @max_attempts = gets.chomp.to_i
    elsif @difficulty == "easy"
      @max = @min + 10
    elsif @difficulty == "medium"
      @max = @min + 50
    elsif @difficulty == "hard"
      @max = @min + 100
    end

    @secret_num = rand(@min..@max)

    print "\nA number between #{@min} and #{@max} has been chosen.\n"
    print "You have #{@max_attempts} guesses. Good luck.\n"
  end

  def check_num(num)
    @num_attempts += 1
    if num == @secret_num
      @game_over = true 
      @winner = true
    elsif num > @secret_num
      print "\nThat guess was too big."
    elsif num < @secret_num
      print "\nThat guess was too small."
    end

    @game_over = true if @num_attempts >= @max_attempts

    if @game_over == false
      print "\nYou have #{@max_attempts - @num_attempts} guesses remaining."
    end

  end

  def ask_user
    print "\nSelect a number: " if @num_attempts < 1
    print "\nSelect another number: " if @num_attempts >= 1
    input = gets.chomp.to_i
    check_num(input)
  end

  def speak(text)
    `say #{text}`
  end

  def end_game
    if @winner == true
      print "Congratulations #{@user_name[0].upcase + @user_name[1..-1].downcase}, you've guessed correctly."
      print "\nYou succeeded in #{@num_attempts} tries with #{@max_attempts - @num_attempts} remaining. Well done."
      print "\n\nPress any key to exit."
      `afplay lib/sound.wav`
      gets
      system "clear"
    else
      print "\nYour #{@max_attempts} guesses have been used. You have failed."
      print "\nThe number you were looking for was #{@secret_num}."
      print "\nBetter luck nex time #{@user_name[0].upcase + @user_name[1..-1].downcase}."
      print "\n\nPress any key to exit."
      gets
      system "clear"
    end
  end

end
