require_relative 'piece'

class Pawn < Piece

  def symbol
    return " ♙ " if color == :white
    " ♟ "
  end

end
