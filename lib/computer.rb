# lib/computer.rb
require 'pry'
require './lib/ship'

class Computer

  def initialize
    @ship = Ship.new
    @ship_short = []
    @ship_medium = []
  end

  def available
    ["a1", "a2", "a3", "a4",
     "b1", "b2", "b3", "b4",
     "c1", "c2", "c3", "c4",
     "d1", "d2", "d3", "d4"]
  end

   def create_ships
     create_two_unit_ship
     binding.pry
     create_three_unit_ship
   end

   def create_two_unit_ship
     coord = coordinate_generator
     go_adjacent(coord)
   end

   def create_three_unit_ship
     coord = coordinate_generator
     binding.pry
     if @ship_short.any? {|x| x == coord}
       create_three_unit_ship
     else
       second_coordinate = go_adjacent(coord)
       third_coordinate = go_adjacent(coord)
       binding.pry
     end
   end



   def three_unit_ship_comparator (second_coordinate, third_coordinate)
     second_coordinate == third_coordinate ||
     @ship_short.any? {|x| x == second_coordinate} ||
     @ship_short.any? {|x| x == third_coordinate}
   end

   def place_three_unit_ship_horizontal
     initial_point = ('a'..'d').to_a.sample + ('1'..'2').to_a.sample
     initial_point + initial_point[0] + @ship.character_up(initial_point)
     + initial_point[0] + @ship.character_up(@ship.character_up(initial_point))
   end

   def place_three_unit_ship_vertical
     initial_point = ('a'..'b').to_a.sample + ('1'..'4').to_a.sample
     initial_point + @ship.character_down(initial_point) +
     initial_point[1] + @ship.character_down(@ship.character_down(initial_point)) +
     initial_point[1]
   end

   def coordinate_generator
     ('a'..'d').to_a.sample + ('1'..'4').to_a.sample
   end

   def place_short_ship(input)
     formatted_coordinates = @ship.split_and_sort(input)
     @ship_short = formatted_coordinates
   end

   def go_adjacent(coord)
     input = rand(4)
     case input
     when 0
      ship = go_up(coord)
      place_short_ship(ship)
     when 1
      ship = go_right(coord)
      place_short_ship(ship)
     when 2
      ship = go_down(coord)
      place_short_ship(ship)
     when 3
      ship = go_left(coord)
      place_short_ship(ship)
     end
   end

   def go_adjacent_three(coord)
     input = rand(4)
     case input
     when 0
      go_up(coord)
     when 1
      go_right(coord)
     when 2
      go_down(coord)
     when 3
      go_left(coord)
     end
   end

     def go_up(input)
       second_coordinate = @ship.character_up(input[0])
       if @ship.valid_letter(second_coordinate)
         input + second_coordinate + input[1]
       else
         go_adjacent(input)
       end
     end

     def go_down(input)
       second_coordinate = @ship.character_down(input[0])
       if @ship.valid_letter(second_coordinate)
        input + second_coordinate + input[1]
       else
         go_adjacent(input)
       end
     end

     def go_left(input)
       second_coordinate = @ship.character_down(input[1])
       if @ship.valid_number(second_coordinate)
         input + input[0] + second_coordinate
       else
         go_adjacent(input)
       end
     end

     def go_right(input)
       second_coordinate = @ship.character_up(input[1])
       if @ship.valid_number(second_coordinate)
        input + input[0] + second_coordinate
         # valid combination, push coordinates
       else
        go_adjacent(input)
       end
     end
end

cpu = Computer.new
binding.pry
# 100.times do
#   puts cpu.create_two_unit_ship
# end
