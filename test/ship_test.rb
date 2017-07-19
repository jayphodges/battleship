# require 'simplecov'
# SimpleCov.start
require './lib/ship'
require 'pry'
require 'minitest/autorun'
require 'minitest/emoji'

class ShipTest < Minitest::Test

  def setup
    @ship = Ship.new
  end

  def test_for_valid_letter
    assert @ship.valid_letter("a")
    assert @ship.valid_letter("d")
    refute @ship.valid_letter("A")
    refute @ship.valid_letter("1")
  end

  def test_for_valid_number
    assert @ship.valid_number("1")
    assert @ship.valid_number("4")
    refute @ship.valid_number("5")
    refute @ship.valid_number("a")
  end

  def test_for_character_down
    assert_equal "a", @ship.character_down("b")
    assert_equal "W", @ship.character_down("X")
  end

  def test_for_character_up
    assert_equal "b", @ship.character_up("a")
    assert_equal "X", @ship.character_up("W")
    assert_equal "1", @ship.character_up("0")
  end

  def test_for_character_ups
    assert_equal "c", @ship.character_up("a")
    assert_equal "Y", @ship.character_up("W")
  end

  def test_for_adjacent_units
    assert @ship.adjacent_units("b", "a")
    assert @ship.adjacent_units("M", "N")
    assert @ship.adjacent_units("1", "2")
    refute @ship.adjacent_units("a","c")
  end

  def test_vertical_and_horizontal_check

  end

  def test_converting_to_pairs
    assert_equal ["11","11","11"],
     @ship.convert_to_pairs("111111")
    assert_equal ["Ab","Cd"],
     @ship.convert_to_pairs("AbCdE")
  end

  def test_input_formatter
    skip
    assert_equal ["A1","B2"],
     @ship.format_input("a1b2")
    assert_equal ["AA", "ZZ"],
     @ship.format_input("aaZz")
    assert_equal ["AS", "DF", "12", "34"],
     @ship.format_input("asdf1234")
  end

  def test_two_unit_adjacency
    assert @ship.two_unit_adjacency(["a1", "b1"])
  end


end
