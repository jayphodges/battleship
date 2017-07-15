# lib/board.rb
require './lib/box'
require 'pry'

class Board

  def initialize
    @a1 = Box.new
    @a2 = Box.new
    @a3 = Box.new
    @a4 = Box.new
    @b1 = Box.new
    @b2 = Box.new
    @b3 = Box.new
    @b4 = Box.new
    @c1 = Box.new
    @c2 = Box.new
    @c3 = Box.new
    @c4 = Box.new
    @d1 = Box.new
    @d2 = Box.new
    @d3 = Box.new
    @d4 = Box.new
    @a1.p1_hit = true
    @a2.p1_hit = true
    @a2.p2_ship = true
  end

  def return_board

  end

  def border
    puts "  ==========="
  end

  def header
    puts " . 1 2 3 4"
  end

  def print_board
    border
    header
    # binding.pry
    # @a1.p1_hit = true
    # @a2.p2_ship = true
    # @s2.p1_hit = true
    puts " A " + @a1.icon? + " " + @a2.icon? + " " + @a3.icon? + " " + @a4.icon?
    puts " B " + @b1.icon? + " " + @b2.icon? + " " + @b3.icon? + " " + @b4.icon?
    puts " C " + @c1.icon? + " " + @c2.icon? + " " + @c3.icon? + " " + @c4.icon?
    puts " D " + @d1.icon? + " " + @d2.icon? + " " + @d3.icon? + " " + @d4.icon?
    border
  end


end
# game = Board.new
# game.print_board

# ===========
# . 1 2 3 4
# A  M
# B
# C
# D
# ===========
