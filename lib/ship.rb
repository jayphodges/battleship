# can handle position checking for ship placement?
# require './lib/ai'
# require './lib/board'
# require './lib/box'
# require './lib/ship'
require 'pry'

class Ship

  def valid_letter(letter)
    letter.upcase
    valid = ['A', 'B', 'C', 'D']
    valid.any? {|x| x==letter}
  end

  def valid_number(number)
    valid = ['1', '2', '3', '4']
    valid.any? {|x| x==letter}
  end

  def letter_down(letter)
    (letter.codepoints.first - 1).chr
  end

  def letter_up(letter)
    (letter.codepoints.first + 1).chr
  end

  def compare_letters(a, b)

  end

  def adjacent_letters(a, b)
    a == letter_down(b) || a == letter_up(b)
  end

  def adjacent_numbers(a, b)
    a == b - 1 || a == b + 1
  end

end
ship = Ship.new
binding.pry
