require_relative "board"
require_relative "display"
require_relative "pieces"
require_relative "human_player"

class Game

  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @player = HumanPlayer.new(:white, @display)
  end

  def play
    until @board.checkmate?
      take_turn
    end
    puts "Checkmate."
  end

  def take_turn
    @display.render
    move_pos = @player.make_move
    @board.move(move_pos[0], move_pos[1])
    @display.render
  end

  def notify_players

  end

  def swap_turn

  end

end

if __FILE__ == $PROGRAM_NAME

  game = Game.new
  game.play
end
