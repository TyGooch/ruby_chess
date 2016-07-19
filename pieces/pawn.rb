require_relative 'piece'
require 'byebug'
class Pawn < Piece

  def symbol
    return " ♙ " if color == :white
    " ♟ "
  end

  def moves
    row, col = pos
    result = []
    forward_steps.each do |step|
      result << [row + step, col]
    end
    result
  end


  private

  def at_start_row?
    (color == :white) ? (return pos[0] == 6) : (return pos[0] == 1)
    false
  end

  def forward_dir
    (color == :white) ? (-1) : (1)
  end

  def forward_steps
    # byebug
    dir = [forward_dir]
    dir << (2 * forward_dir) if at_start_row?
    dir
  end

  def side_attacks
    
  end

end
