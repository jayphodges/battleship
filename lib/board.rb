# lib/board.rb
require './lib/box.rb'
require 'pry'

class Board
  attr_accessor :a1, :a2, :a3, :a4,
                :b1, :b2, :b3, :b4,
                :c1, :c2, :c3, :c4,
                :d1, :d2, :d3, :d4,
                :p1_ship1,
                :p1_ship2,
                :p2_ship1,
                :p2_ship2

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
    @a3.p1_hit = true
    @a4.p1_hit = true
  end

  def a1
    @a1
  end

  def return_board

  end

  def border
    puts " ==========="
  end

  def header
    puts " . 1 2 3 4"
  end

  def print_board
    border
    header
    puts " A " + @a1.icon? + " " + @a2.icon? + " " + @a3.icon? + " " + @a4.icon?
    puts " B " + @b1.icon? + " " + @b2.icon? + " " + @b3.icon? + " " + @b4.icon?
    puts " C " + @c1.icon? + " " + @c2.icon? + " " + @c3.icon? + " " + @c4.icon?
    puts " D " + @d1.icon? + " " + @d2.icon? + " " + @d3.icon? + " " + @d4.icon?
    border
  end

  def insert_items(*ship)
    ship.each {|coord| insert_p1_ship}
  end

  def insert_p1_hit(input)
    at_input = instance_variable_get("@#{input}")
    at_input.p1_hit = true
  end

  def insert_p2_hit(input)
    at_input = instance_variable_get("@#{input}")
    at_input.p2_hit = true
  end

  def insert_p1_ships(ship1, ship2)
    ships = ship1 + ship2
    ships.each do |input|
      at_input = instance_variable_get("@#{input}")
      at_input.p1_ship = true
    end
  end

  def insert_p2_ships(ship1, ship2)
    ships = ship1 + ship2
    ships.each do |input|
      at_input = instance_variable_get("@#{input}")
      at_input.p2_ship = true
    end
  end


end
game = Board.new
game.print_board
# game.insert_p1_hit("d1")
binding.pry

# ===========
# . 1 2 3 4
# A  M
# B
# C
# D
# ===========
