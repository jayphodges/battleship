# can handle position checking for ship placement?
require './lib/ai'
require './lib/board'
require './lib/box'
require './lib/ships'
require 'pry'

class Battleship

  def valid_letter(letter)
    letter.upcase   # assumed input is a1 or A1,
    valid = ['A', 'B', 'C', 'D']
    valid.any? {|x| x==letter}

  end

  def valid_number(number)

  end

  def letter_down(letter)
    letter = ("letter".codepoints.first - 1).chr
  end

  def letter_up(letter)
    letter = ("letter".codepoints.first + 1).chr
  end




end
