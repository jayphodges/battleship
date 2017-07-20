# require 'simplecov'
# SimpleCov.start
require './lib/box'
require 'pry'
require 'minitest/autorun'
require 'minitest/emoji'

class BoxTest < Minitest::Test

  def setup
    @box = Box.new
  end

  def test_box_star
    refute @box.p1_hit
  end

  def test_box_p1_hit
    refute @box.p1_hit
  end

  def test_box_p2_hit
    refute @box.p1_hit
  end

  def test_box_p1_ship
    refute @box.p1_ship
  end

  def test_box_p2_ship
    refute @box.p1_ship
  end

  def test_map1_icon
    assert_equal " ", @box.map1
  end

  def test_map1_miss_icon
    @box.p1_hit = true
    assert_equal "M", @box.map1
  end

  def test_map1_hit_icon
    @box.p1_hit = true
    @box.p2_ship = true
    assert_equal "H", @box.map1
  end

  def test_map2_icon
    assert_equal " ", @box.map2
  end

  def test_map2_miss_icon
    @box.p2_hit = true
    assert_equal "O", @box.map2
  end

  def test_map2_ship_icon
    @box.p1_ship = true
    assert_equal "#", @box.map2
  end

  def test_map2_hit_icon
    @box.p1_ship = true
    @box.p2_hit = true
    assert_equal "X", @box.map2
  end

end
