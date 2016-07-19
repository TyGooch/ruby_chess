require 'singleton'

class NullPiece
  include Singleton

  def initialize

  end

  def moves
    nil
  end

  def color
    :none
  end

  def to_s
    "   "
  end

  def empty?
    true
  end

  def in_check?
    false
  end

end
