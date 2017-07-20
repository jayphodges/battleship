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
    assert_equal "c", @ship.character_ups("a")
    assert_equal "Y", @ship.character_ups("W")
  end

  def test_for_adjacent_units
    assert @ship.adjacent_units("b", "a")
    assert @ship.adjacent_units("M", "N")
    assert @ship.adjacent_units("1", "2")
    refute @ship.adjacent_units("a","c")
  end

  def test_two_unit_adjacency
    assert @ship.two_unit_adjacency(["a1", "a2"])
    assert @ship.two_unit_adjacency(["b9", "f9"])
    refute @ship.two_unit_adjacency(["bb", "dd"])
  end

  def test_three_unit_adjacency_letters
    skip
    assert @ship.three_unit_adjacency_letters(["a1", "a2", "a3"])
    assert @ship.three_unit_adjacency_letters(["h9", "hd", "h5"])
    refute @ship.three_unit_adjacency_letters(["d0", "a1", "d9"])
  end

  def test_three_unit_adjacency_numbers
    skip
    assert @ship.three_unit_adjacency_numbers(["a1", "b1", "c1"])
    assert @ship.three_unit_adjacency_numbers(["09", "r9", "a9"])
    refute @ship.three_unit_adjacency_numbers(["d9", "a1", "d9"])
  end

  def test_converting_to_pairs
    skip
    assert_equal ["11","11","11"],
     @ship.convert_to_pairs("111111")
    assert_equal ["Ab","Cd"],
     @ship.convert_to_pairs("AbCdE")
  end

  def test_two_unit_adjacency
    skip
    assert @ship.two_unit_adjacency(["a1", "b1"])
  end


end
