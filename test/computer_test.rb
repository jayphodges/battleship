# /lib/computer_test.rb
# require 'simplecov'
# SimpleCov.start
require './lib/computer'
require 'pry'
require 'minitest/autorun'
require 'minitest/emoji'

class ComputerTest < Minitest::Test

  def setup
    @cpu = Computer.new
