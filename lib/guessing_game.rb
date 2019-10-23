require "byebug"

class GuessingGame

  attr_reader :num_attempts

  def initialize(min, max)
    # debugger
    @secret_num = rand(min..max)
    @num_attempts = 0
    @game_over = false
  end

  def game_over?
    @game_over
  end

  def check_num(num)
    @num_attempts += 1
    if num == @secret_num
      @game_over = true 
      print "\nYou win.\n"
    elsif num > @secret_num
      print "\nThat guess was too big."
    elsif num < @secret_num
      print "\nThat guess was too small."
    end
  end

  def ask_user
    print "\nSelect a number: " if @num_attempts < 1
    print "\nSelect another number: " if @num_attempts >= 1
    input = gets.chomp.to_i
    check_num(input)
  end

end
