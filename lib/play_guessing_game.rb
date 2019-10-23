# No need to change or write any code in this file.
#
# After you complete all specs, you can simulate your game by
# running this file with `ruby lib/play_guessing_game.rb` in your terminal!

require_relative "guessing_game"

guessing_game = GuessingGame.new

guessing_game.new_game

until guessing_game.game_over?
  guessing_game.ask_user
  print "\n"
end

guessing_game.end_game