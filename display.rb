require "colorize"
require_relative "cursorable"
require_relative "board"
require_relative "player"
require 'byebug'

class Display
  include Cursorable
  attr_reader :board

  def initialize(board)
    @board = board
    @cursor_pos = [0, 0]
  end

  def build_grid
    @board.rows.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      color_options = colors_for(i, j)
      piece.to_s.colorize(color_options)
    end
  end

  def colors_for(i, j)
    if [i, j] == @cursor_pos
      bg = :light_red
    elsif (i + j).odd?
      bg = :red
    else
      bg = :grey
    end
    { background: bg, color: :white }
  end

  def move
    result = nil
    until result
      render
      result = get_input
    end
    @selected = true
    result
  end

  def render
    system("clear")
    puts "Fill the grid!"
    puts "Arrow keys, WASD, or vim to move, space or enter to confirm."
    x = build_grid
    build_grid.each { |row| puts row.join }
  end
end

# board = Board.new
#
# d = Display.new(board)
# d.render
# d.board.move([6,0],[4,0])
# d.render
# d.board.move([7,0],[5,0])
# d.render
# d.board.move([7,1],[5,2])
# d.render
# d.board.move([1,3], [3,3])
# d.render
# d.board.move([5,2], [3,3])
# d.render
# d.board.move([5,0], [5,7])
# d.render
# d.board.move([5,7], [1,7])
# d.render
#
# # testing for pawn
# # d.board.move([1,7], [2,7])
# # d.board.move([2,7], [2,4])
# # d.board.move([2,4], [1,4])
# #
# # d.board.move([1,2], [2,2])
# # d.board.move([2,2], [3,3])
#
# d.render
# p d.board.checkmate?(:black)
