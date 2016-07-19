require_relative 'pieces'
# require_relative 'pieces/pawn'
# require_relative 'pieces/null_piece'
class Board
  attr_reader :rows
  COLORS = [:white, :black]
  def initialize()
    @rows = Array.new(8) { Array.new(8) {NullPiece.instance} }
    populate
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

  private

  def fill_pawn(color)
    row = 1
    row = 6 if color == :white
    8.times { |col|  @rows[row][col] = Pawn.new(color, self, [row, col]) }
  end

  def fill_rook(color)
    row = 0
    row = 7 if color == :white
    @rows[row][0] = Rook.new(color, self, [row, 0])
    @rows[row][7] = Rook.new(color, self, [row, 7])
  end

  def fill_knight(color)
    row = 0
    row = 7 if color == :white
    @rows[row][1] = Knight.new(color, self, [row, 1])
    @rows[row][6] = Knight.new(color, self, [row, 6])
  end

  def fill_bishop(color)
    row = 0
    row = 7 if color == :white
    @rows[row][2] = Bishop.new(color, self, [row, 2])
    @rows[row][5] = Bishop.new(color, self, [row, 5])
  end

  def fill_king(color)
    row = 0
    row = 7 if color == :white
    @rows[row][3] = King.new(color, self, [row, 3])
  end

  def fill_queen(color)
    row = 0
    row = 7 if color == :white
    @rows[row][4] = Queen.new(color, self, [row, 4])
  end

  def populate
    COLORS.each do |color|
      fill_pawn(color)
      fill_rook(color)
      fill_knight(color)
      fill_bishop(color)
      fill_queen(color)
      fill_king(color)
    end
  end

end
