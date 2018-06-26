class CLI

  def call
    puts "Welcome to Tic Tac Toe!"
    game = Game.new
    until game.won?
      game.play
    end


    play_again = nil
    until play_again.downcase == "n" || play_again.downcase == "no"
      puts "Would you like to play again?"
      play_again = gets.strip
      if play_again.downcase == "y" || play_again.downcase == "yes"
          self.play_game
        end
    end
  end
end
