# lib/ai.rb
require 'pry'
require './lib/ship'

class Computer

  def initialize
    @availale = ["a1", "a2", "a3", "a4",
                 "b1", "b2", "b3", "b4",
                 "c1", "c2", "c3", "c4",
                 "d1", "d2", "d3", "d4"]
    @ship = Ship.new
  end

   def create_two_unit_ship
     coord = @available.sample
     go_adjacent(coord)
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
       go_right(coordinates)
     end
   end

     def go_up(input)
       second_coordinate = @ship.letter_up(coord[0])
       if @ship.valid_letter(second_coordinate)
         binding.pry
       else
         binding.pry
         go_adjacent(coord)
       end
     end

     def go_down(input)
       second_coordinate = @ship.letter_down(coord[0])
       if @ship.valid_letter(second_coordinate)
        binding.pry
         # valid combination, push coordinates
       else
        binding.pry
         go_adjacent(coord)
       end
     end

     def go_left(input)
       second_coordinate = @ship.letter_down(coord[1])
       if @ship.valid_letter(second_coordinate)
         binding.pry
       else
         binding.pry
         go_adjacent(coord)
       end
     end

     def go_right(input)
       second_coordinate = @ship.letter_up(coord[1])
       if @ship.valid_letter(second_coordinate)
        binding.pry
         # valid combination, push coordinates
       else
        binding.pry
         go_adjacent(coord)
       end
     end
end
cpu = computer.new
binding.pry
