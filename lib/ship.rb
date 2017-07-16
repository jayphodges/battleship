# can handle position checking for ship placement?
# require './lib/ai'
# require './lib/board'
# require './lib/box'
# require './lib/ship'
require 'pry'

class Ship

  def valid_letter(letter)
    valid = ['A', 'B', 'C', 'D']
    valid.any? {|x| x==letter}
  end

  def valid_number(number)
    valid = ['1', '2', '3', '4']
    valid.any? {|x| x==number}
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

  def vertical_horizontal(a1, a2, b1, b2)
    (a1 == b1) || (a2 == b2)
  end

  def two_unit_ship_input(input)
    # expected input ["A1","A2"]

    adjacent_letter(input[0][0], input[1][0])
    adjacent_number(input[0][1], input[1][1])

  end

  def convert_to_pairs(input)
    input.scan(/../)
  end

  def format_input(input)
    input.upcase!
    input.gsub!(/[\s,]/ ,"")
    input.scan(/../)
  end

end
# ship = Ship.new
# binding.pry
