require 'simplecov'
SimpleCov.start
require './lib/board'
require 'pry'
require 'minitest/autorun'
require 'minitest/emoji'

class BoardTest < Minitest::Test

  def setup
    @board = Board.new
  end

  def insert_p1_hit(input)
    binding.pry
    at_input = instance_variable_get("@#{input}")
    at_input.p1_hit = true
  end

  def insert_p2_hit(input)
    skip
    at_input = instance_variable_get("@#{input}")
    at_input.p2_hit = true
  end

  def insert_p1_ship(ship)
    skip
    # ships = ship1 + ship2
    ship.each do |input|
      at_input = instance_variable_get("@#{input}")
      at_input.p1_ship = true
    end
  end

  def insert_p2_ship(ship)
    skip
    ship.each do |input|
      at_input = instance_variable_get("@#{input}")
      at_input.p2_ship = true
    end
  end

  def position_available(input)
    skip
    at_input = instance_variable_get("@#{input}")
    !at_input.p1_hit && @ship.valid_letter(input[0]) && @ship.valid_number(input[1])
  end

end
