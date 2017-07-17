require 'simplecov'
SimpleCov.start
require './lib/ship'
require 'pry'
require 'minitest/autorun'
require 'minitest/emoji'

class ShipTest < Minitest::Test

  def setup
    @ship = Ship.new
  end

  def test_for_valid_letter
    assert @ship.valid_letter("A")
    assert @ship.valid_letter("D")
    refute @ship.valid_letter("a")
    refute @ship.valid_letter("1")
  end

  def test_for_valid_number
    assert @ship.valid_number("1")
    assert @ship.valid_number("4")
    refute @ship.valid_number("5")
    refute @ship.valid_number("a")
  end

  def test_for_letter_up
    assert_equal "b", @ship.letter_up("a")
    assert_equal "X", @ship.letter_up("W")
  end

  def test_for_letter_down
    assert_equal "a", @ship.letter_down("b")
    assert_equal "W", @ship.letter_down("X")
  end

  def test_for_adjacent_letters
    assert @ship.adjacent_letters("b", "a")
    assert @ship.adjacent_letters("B", "A")
    assert @ship.adjacent_letters("m", "n")
    refute @ship.adjacent_letters("a","c")
  end

  def test_for_adjacent_numbers
    assert @ship.adjacent_numbers(1, 2)
    assert @ship.adjacent_numbers(9, 10)
    refute @ship.adjacent_numbers(1, 3)
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
    assert_equal ["A1","B2"],
     @ship.format_input("a1b2")
    assert_equal ["AA", "ZZ"],
     @ship.format_input("aaZz")
    assert_equal ["AS", "DF", "12", "34"],
     @ship.format_input("asdf1234")
  end



end
