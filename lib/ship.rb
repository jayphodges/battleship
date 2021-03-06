require 'pry'

class Ship

  def valid_letter(letter)
    valid = ['a', 'b', 'c', 'd']
    valid.any? {|x| x==letter}
  end

  def valid_number(number)
    valid = ['1', '2', '3', '4']
    valid.any? {|x| x==number}
  end

  def character_down(letter)
    (letter.codepoints.first - 1).chr
  end

  def character_up(letter)
    (letter.codepoints.first + 1).chr
  end

  def character_ups(letter)
    (letter.codepoints.first + 2).chr
  end

  def adjacent_units(a, b)
    a == character_down(b) || a == character_up(b)
  end

  def two_unit_adjacency(input)
    adjacent_units(input[0][0], input[1][0]) || adjacent_units(input[0][1], input[1][1])
  end

  def three_unit_adjacency_letters(input)
    first = input[0][0]
    second = input[1][0]
    third = input[2][0]
    first = second && second = third
  end

  def three_unit_adjacency_numbers(input)
    first = input[0][1]
    second = input[1][1]
    third = input[2][1]
    first = second && second = third
  end

  def format_input(input)
    formatted_input = input.gsub!(/[\s,]/ ,"")
    coords = formatted_input.downcase
    coords.scan(/../).sort
  end

  def hit_format(input)
    formatted_input = input.input.gsub!(/[\s,]/ ,"")
    coords = formatted_input.downcase
  end

  def split_and_sort(input)
    input.scan(/../).sort
  end

end
