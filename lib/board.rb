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
    # @a1.p1_hit = true
    # @a2.p1_hit = true
    # @a2.p2_ship = true
    # @a3.p1_hit = true
    # @a4.p1_hit = true
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
    puts "  Opponent"
    header
    puts " A " + @a1.icon? + " " + @a2.icon? + " " + @a3.icon? + " " + @a4.icon?
    puts " B " + @b1.icon? + " " + @b2.icon? + " " + @b3.icon? + " " + @b4.icon?
    puts " C " + @c1.icon? + " " + @c2.icon? + " " + @c3.icon? + " " + @c4.icon?
    puts " D " + @d1.icon? + " " + @d2.icon? + " " + @d3.icon? + " " + @d4.icon?
    border
  end

  def p1_board
    border
    puts "  Player"
    header
    puts " A " + @a1.p1_map + " " + @a2.p1_map + " " + @a3.p1_map + " " + @a4.p1_map
    puts " B " + @b1.p1_map + " " + @b2.p1_map + " " + @b3.p1_map + " " + @b4.p1_map
    puts " C " + @c1.p1_map + " " + @c2.p1_map + " " + @c3.p1_map + " " + @c4.p1_map
    puts " D " + @d1.p1_map + " " + @d2.p1_map + " " + @d3.p1_map + " " + @d4.p1_map
    border
  end
  # def print_boards
  #   border
  #   header
  #   puts " A " + @a1.icon? + " " + @a2.icon? + " " + @a3.icon? + " " + @a4.icon? + "           " +
  #   puts " B " + @b1.icon? + " " + @b2.icon? + " " + @b3.icon? + " " + @b4.icon? + "           " +
  #   puts " C " + @c1.icon? + " " + @c2.icon? + " " + @c3.icon? + " " + @c4.icon? + "           " +
  #   puts " D " + @d1.icon? + " " + @d2.icon? + " " + @d3.icon? + " " + @d4.icon? + "           " +
  #   border
  # end

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
