# lib/computer.rb
require 'pry'
require './lib/ship'

class Computer
  attr_reader :positions,
              :short_ship,
              :medium_ship

  def initialize
    @ship = Ship.new
    @short_ship = []
    @medium_ship = []
    @positions = ["a1", "a2", "a3", "a4",
                  "b1", "b2", "b3", "b4",
                  "c1", "c2", "c3", "c4",
                  "d1", "d2", "d3", "d4"]
  end

  def coordinate_generator
    ('a'..'d').to_a.sample + ('1'..'4').to_a.sample
  end

  def create_ships
    create_two_unit_ship
    ship_deintersector
    puts "First ship: #{@short_ship}, Second ship: #{@medium_ship}"
  end

  def ship_deintersector
    create_three_unit_ship
    comparator = @short_ship & @medium_ship
    if !comparator.empty?
      ship_deintersector
    else
      @medium_ship
    end
  end

  def select_move
    next_move = @positions.sample
    @positions.delete(next_move)
    next_move
  end

  def create_two_unit_ship
    coord = coordinate_generator
    first_ship = go_adjacent(coord)
    @short_ship = @ship.split_and_sort(first_ship)
    @short_ship.inspect
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
    else
     go_adjacent(input)
    end
  end

  def create_three_unit_ship
    if rand(0) == 0
      place_three_unit_ship_horizontal
    else
      place_three_unit_ship_vertical
    end
  end

  def place_three_unit_ship_horizontal
    first_point = ('a'..'d').to_a.sample + ('1'..'2').to_a.sample
    second_point = first_point[1] + @ship.character_up(first_point[1])
    third_point = first_point[1] +@ship.character_ups(first_point[0])
    coordinates = first_point + second_point + third_point
    @ship.split_and_sort(coordinates)
  end

  def place_three_unit_ship_vertical
    initial_point = ('a'..'b').to_a.sample + ('1'..'4').to_a.sample
    second_point = @ship.character_up(initial_point[0]) + initial_point[1]
    third_point = @ship.character_ups(initial_point[0]) + initial_point[1]
    coordinates = initial_point + second_point + third_point
    @medium_ship = @ship.split_and_sort(coordinates)
    @medium_ship.inspect
  end

end
