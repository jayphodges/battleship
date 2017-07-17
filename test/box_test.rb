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

  def test_box_icon
    assert_equal " ", @box.icon?
  end

  def test_box_miss_icon
    @box.p1_hit = true
    assert_equal "M", @box.icon?
  end

  def test_box_hit_icon
    @box.p1_hit = true
    @box.p2_ship = true
    assert_equal "\u26DD".encode('utf-8'), @box.icon?
  end
end
