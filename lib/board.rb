# lib/board.rb
require './lib/ship.rb'
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
    @ship = Ship.new
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
    puts "  Opponent"
    header
    puts " A " + @a1.map1 + " " + @a2.map1 + " " + @a3.map1 + " " + @a4.map1
    puts " B " + @b1.map1 + " " + @b2.map1 + " " + @b3.map1 + " " + @b4.map1
    puts " C " + @c1.map1 + " " + @c2.map1 + " " + @c3.map1 + " " + @c4.map1
    puts " D " + @d1.map1 + " " + @d2.map1 + " " + @d3.map1 + " " + @d4.map1
    border
  end

  def p1_board
    border
    puts "  Player"
    header
    puts " A " + @a1.map2 + " " + @a2.map2 + " " + @a3.map2 + " " + @a4.map2
    puts " B " + @b1.map2 + " " + @b2.map2 + " " + @b3.map2 + " " + @b4.map2
    puts " C " + @c1.map2 + " " + @c2.map2 + " " + @c3.map2 + " " + @c4.map2
    puts " D " + @d1.map2 + " " + @d2.map2 + " " + @d3.map2 + " " + @d4.map2
    border
  end

  def insert_p1_hit(input)
    at_input = instance_variable_get("@#{input}")
    at_input.p1_hit = true
  end

  def insert_p2_hit(input)
    at_input = instance_variable_get("@#{input}")
    at_input.p2_hit = true
  end

  def insert_p1_ship(ship)
    # ships = ship1 + ship2
    ship.each do |input|
      at_input = instance_variable_get("@#{input}")
      at_input.p1_ship = true
    end
  end

  def insert_p2_ship(ship)
    ship.each do |input|
      at_input = instance_variable_get("@#{input}")
      at_input.p2_ship = true
    end
  end

  def position_available(input)
    at_input = instance_variable_get("@#{input}")
    !at_input.p1_hit && @ship.valid_letter(input[0]) && @ship.valid_number(input[1])
  end

end
