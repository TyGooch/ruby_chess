class Piece
  attr_reader :color, :board, :pos

  def initialize(color = nil, board, pos)
    @color, @board, @pos = color, board, pos
    # @board[pos] = self
  end

  # def moves
  #   # valid_moves
  # end

  def to_s
    symbol
  end

  def empty?
    false
  end

  def valid_moves

  end

  def move_into_check?(to_pos)
    dup_board = @board.deep_dup
    dup_board.move(pos, to_pos).in_check?(@color)
  end

  def symbol

  end

end
