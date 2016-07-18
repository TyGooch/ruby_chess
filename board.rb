require_relative 'null_piece'

class Board
  attr_reader :rows

  def initialize()
    @rows = Array.new(8) { Array.new(8) {NullPiece.instance} }
  end

  def []=(pos, piece = nil)
    x, y = pos[0], pos[1]
    rows[x][y] = piece
  end

  def [](pos)
    x, y = pos[0], pos[1]
    rows[x][y]
  end

  def in_bounds?(pos)
    pos.all? { |x| x.between?(0, 7) }
  end

  def move(start, end_pos)
    self[end_pos] = self[start]
    self[start] = NullPiece.instance
  end

end
