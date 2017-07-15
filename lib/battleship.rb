require './lib/ai'
require './lib/board'
require './lib/node'
require './lib/ships'
require 'pry'

class Battleship

  def initialize
  end

  def intro_prompt
    print "Welcome to BATTLESHIP"
    print "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    # puts ""
  end

  def game_start
    puts(intro_prompt)
    intro_menu
  end

  def intro_menu
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    input = get_response
    case input
      when "p" || "P"
        # call game start method
      when "i" || "I"
        instructions
        intro_menu
      when "q" || "Q"
        exit!
      else
        puts "Clearly that wasn't an option\n\n"
        intro_menu
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

  def get_response
    gets.chomp
  end

  def instructions
    puts "The instructions are a lie\n\n"
  end


end
game = Battleship.new
game.intro_menu
