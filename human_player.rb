require_relative "player"

class HumanPlayer < Player

  def make_move
    start_pos = @display.move
    end_pos = @display.move
    return [start_pos, end_pos]
  end

end
