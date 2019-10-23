# No need to change or write any code in this file.
#
# After you complete all specs, you can simulate your game by
# running this file with `ruby lib/play_guessing_game.rb` in your terminal!

require_relative "guessing_game"

system "clear"

print "---------------------------------------------\n"
print "|                                           |\n"
print "|    Welcome to Tom's Ruby Guessing Game    |\n"
print "|                                           |\n"
print "---------------------------------------------\n\n"

print "Enter a min number: "
min = gets.chomp.to_i

print "Enter a max number: "
max = gets.chomp.to_i

puts "\nA number between #{min} and #{max} has been chosen.\n"

guessing_game = GuessingGame.new(min, max)

until guessing_game.game_over?
  guessing_game.ask_user
  print "\n"
end

puts "You've succeeded in #{guessing_game.num_attempts} tries. Well Done."
print "\nPress any key to exit."
gets
system "clear"

