require_relative "../player.rb"
class Human < Player

  def move(board)
    puts "Enter a position"
    input = gets.strip
    while !board.valid_move?(input)
      puts "Enter a position"
      input = gets.strip
    end

    board.update(input, self)

    input

  end

end
