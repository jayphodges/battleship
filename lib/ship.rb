# can handle position checking for ship placement?
# require './lib/ai'
# require './lib/board'
# require './lib/box'
# require './lib/ship'
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

  # def adjacent_numbers(a, b)
  #   a == b - 1 || a == b + 1
  # end

  def vertical_horizontal(a1, a2, b1, b2)
    (a1 == b1) || (a2 == b2)
  end

  def three_unit_adjacency(first, second, third)
    adjacent_units(first,second) && adjacent_units(second,third)
  end

  # def two_unit_ship_input(input)
  #   # expected input ["a1","a2"]
  #   # input = format_input(user_input)
  #   # binding.pry
  #   if input.count == 2
  #     puts "Incorrect number of coordinates"
  #   elsif two_unit_adjacency(input)
  #     puts "Ship is not vertical or horizontal"
  #   else
  #     input
  #   end
  # end

  def two_unit_adjacency(input)
    adjacent_units(input[0][0], input[1][0]) || adjacent_units(input[0][1], input[1][1])
  end

  def three_unit_ship_input(user_input)
    input = format_input(user_input)
    if input.count != 2
      puts "Incorrect number of coordinates"
      # returns to game start_prompt
    elsif !three_unit_adjacency
      puts "Incorrect placement"
      # returns to game start_prompt
    else
      puts "Can't have two ships in the same space"
      # returns to game start_prompt
    # else
    #   # inserts data into board / box
    end
  end

  # def convert_to_pairs(input)
  #   input.scan(/../)
  # end

  def format_input(input)
    formatted_input = input.gsub!(/[\s,]/ ,"")
    # binding.pry
    coords = formatted_input.downcase
    coords.scan(/../).sort
    # binding.pry
  end

  def split_and_sort(input)
    input.scan(/../).sort
  end

end
# ship = Ship.new
# ship.two_unit_ship_input("a1 D1")
# # binding.pry
