require_relative "board"
require_relative "display"
require_relative "pieces"
require_relative "human_player"

class Game

  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @player1 = HumanPlayer.new(:white, @display)
    @player2 = HumanPlayer.new(:black, @display)
    @players = [@player1, @player2]
    @curr_idx = 0
  end

  def play
    until @board.checkmate?
      take_turn
    end
    system ("clear")
    @display.end_render
    puts "Checkmate."
  end

  def take_turn
    begin
      puts "It's #{@players[@curr_idx].color}'s turn."
      move_pos = @players[@curr_idx].make_move
      @board.move(move_pos[0], move_pos[1])
    rescue Exception => e
      puts "Got error: #{e}"
      sleep 1
      retry
    end
    swap_turn
  end

  def notify_players

  end

  def swap_turn
    if @curr_idx == 0
      @curr_idx = 1
    else
       @curr_idx = 0
    end
  end

end

if __FILE__ == $PROGRAM_NAME

  game = Game.new
  game.play
end
