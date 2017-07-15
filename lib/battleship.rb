require './lib/ai'
require './lib/board'
require './lib/node'
require './lib/ships'
require 'pry'

class Battleship

  def initialize
    @a1 = Node.new('a1'), @a2 = Node.new('a2'), @a3 = Node.new('a3'), @a4 = Node.new('a4')
    @b1 = Node.new('b1'), @b2 = Node.new('b2'), @b3 = Node.new('b3'), @b4 = Node.new('b4')
    @c1 = Node.new('c1'), @c2 = Node.new('c2'), @c3 = Node.new('c3'), @c4 = Node.new('c4')
    @d1 = Node.new('d1'), @d2 = Node.new('d2'), @d3 = Node.new('d3'), @d4 = Node.new('d4')
  end

  def intro_prompt
    puts "Welcome to BATTLESHIP"
    puts
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    # puts ""
  end

  def game_start
    intro
    input = gets.chomp
  end

  def intro_menu
    case input
      when "p" || "P"
        # call game start method
      when "i" || "I"
        # call instructions
      when "q" || "Q"
        exit!
      else
        puts "Clearly that wasn't an option"
        puts ""
    end
  end

  def start_prompt
    puts "I have laid out my ships on the grid."
    puts "You now need to layout your two ships."
    puts "The first is two units long and the"
    puts "second is three units long."
    puts "The grid has A1 at the top left and D4 at the bottom right."
    puts ""
    puts "Enter the squares for the two-unit ship: "
  end

  def instructions

  end


end
