class Game
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def turn
    move = current_player.move(@board)
    if !@board.valid_move?(move)
      turn
    else
      @board.display
      @board.update(move,current_player)
      @board.display
      puts ""
      puts ""
    end
  end

  def play
    while !(self.draw? || self.won?)
      self.turn
      break if (self.draw? || self.won?)
    end
    puts "Congratulations #{self.winner}!" if self.won?
    puts "Cat's Game!" if self.draw?
  end

  def current_player
    if @board.turn_count.odd?
      @player_2
    else
      @player_1
    end
  end

  def won?
    winner = WIN_COMBINATIONS.find do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[0]] == @board.cells[combo[2]] && (@board.cells[combo[0]] == "X" || @board.cells[combo[0]] == "O")
        #winner = "#{combo[0]}, #{combo[1]}, #{combo[2]}"
      end
    winner
  end

  def draw?
    @board.full? && !self.won?
  end

  def over?
    self.draw? || self.won?
  end

  def winner
    if won = won?
      @board.cells[won.first]
    end
  end

end
