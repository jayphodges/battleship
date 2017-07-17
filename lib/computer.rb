# lib/ai.rb
require 'pry'
require './lib/ship'

class Computer

  def initialize
    # @availale = ["a1", "a2", "a3", "a4",
    #              "b1", "b2", "b3", "b4",
    #              "c1", "c2", "c3", "c4",
    #              "d1", "d2", "d3", "d4"]
    @ship = Ship.new
  end

  def available
    ["a1", "a2", "a3", "a4",
     "b1", "b2", "b3", "b4",
     "c1", "c2", "c3", "c4",
     "d1", "d2", "d3", "d4"]
   end

   def create_two_unit_ship
     coord = coordinate_generator
     go_adjacent(coord)
   end

   def coordinate_generator
     ('a'..'d').to_a.sample + ('1'..'4').to_a.sample
   end

   def go_adjacent(coord)
     input = rand(4)
     case input
     when 0
       go_up(coord)
     when 1
       go_down(coord)
     when 2
       go_left(coord)
     when 3
       go_right(coord)
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
10.times do
  puts cpu.create_two_unit_ship
end
