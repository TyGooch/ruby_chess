class Piece
  attr_reader :color, :board, :pos

  def initialize(color = nil, board, pos)
    @color, @board, @pos = color, board, pos

  end

  def moves
    valid_moves
  end

  def to_s
    symbol
  end

  def empty?

  end

  def valid_moves

  end

  def move_into_check?(to_pos)

  end

  # private??
  def symbol

  end

end
