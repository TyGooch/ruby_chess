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

  def end_build_grid
    @board.rows.map.with_index do |row, i|
    end_build_row(row, i)
    end
  end

  def end_build_row(row, i)
    row.map.with_index do |piece, j|
      color_options = end_colors_for(i, j)
      piece.to_s.colorize(color_options)
    end
  end

  def end_colors_for(i, j)
    selected_array = [[1,1],[1,2],[1,5],[6,1],[5,1],[6,2],[6,3],[6,4],
    [6,5],[6,6],[5,6],[1,6], [3,3], [3,4], [4,3], [4,4]]
    
    if selected_array.include?([i, j])
      bg = :black
    else
      bg = :red
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

  def end_render
    x = build_grid
    end_build_grid.each { |row| puts row.join }
  end
end
