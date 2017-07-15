# lib/board.rb
require './lib/node'
require 'pry'

class Board

  def initialize
    @a1 = Node.new('a1')
    @a2 = Node.new('a2')
    @a3 = Node.new('a3')
    @a4 = Node.new('a4')
    @b1 = Node.new('b1')
    @b2 = Node.new('b2')
    @b3 = Node.new('b3')
    @b4 = Node.new('b4')
    @c1 = Node.new('c1')
    @c2 = Node.new('c2')
    @c3 = Node.new('c3')
    @c4 = Node.new('c4')
    @d1 = Node.new('d1')
    @d2 = Node.new('d2')
    @d3 = Node.new('d3')
    @d4 = Node.new('d4')
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
game = Board.new
game.print_board

# ===========
# . 1 2 3 4
# A  M
# B
# C
# D
# ===========
