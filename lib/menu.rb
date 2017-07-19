require './lib/computer'
require './lib/board'
require './lib/box'
require './lib/ship'
require 'pry'

class Menu

  def initialize
    @board = Board.new
    @ship = Ship.new
  end

  def banner
    system "clear"
    puts "      ____        _   _   _       _____ _     _       "
    puts "     |  _ \\      | | | | | |     / ____| |   (_)      "
    puts "     | |_) | __ _| |_| |_| | ___| (___ | |__  _ _ __  "
    puts "     |  _ < / _` | __| __| |/ _ \\\\___ \\| '_ \\| | '_ \\ "
    puts "     | |_) | (_| | |_| |_| |  __/____) | | | | | |_) |"
    puts "     |____/ \\__,_|\\__|\\__|_|\\___|_____/|_| |_|_| .__/ "
    puts "                                               | |    "
    puts "                                               |_|  "
  end

  def waiting
    sleep(0.05)
  end

  def game_start
    banner
    puts "\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
    intro_menu
  end

  def intro_menu
    input = get_response
    case input
      when "p" || "P"
        start_prompt
      when "i" || "I"
        instructions
      when "q" || "Q"
        exit!
      else
        puts "Clearly that wasn't an option"
        sleep(1)
        game_start
    end
  end

  def start_prompt
    banner
    puts "\n\nI have laid out my ships on the grid. You now need to layout"
    puts "your two ships. The first is two units long and the second is"
    puts "three units long.\n\n"
    puts "The grid has A1 at the top left and D4 at the bottom right.\n\n"
    puts @board.print_board
    puts "\n\nPress return once ready."
    input = get_response
    if input == ""
      two_unit_entry
    # elsif
    #   game_start
    # end
    end
  end

  def two_unit_entry
    banner
    puts "\n\n"
    puts @board.print_board
    puts "\n\nEnter the squares for the two-unit ship:"
    input = get_response
    formatted_input = @ship.format_input(input)
    if formatted_input.count != 2
      puts "Incorrect number of coordinates"
      wait (1)
      two_unit_entry
    elsif @ship.two_unit_adjacency(formatted_input)
      puts "Incorrect number of coordinates"
      wait (1)
      two_unit_entry
    else
      puts "Coordinates accepted!"
      #places coordinates
      #calls three unit entry
    end
  end

  def get_response
    gets.chomp
  end

  def instructions
    banner
    puts "\n\nWelcome to the game of BattleShip! The purpose of the game is to sink"
    puts "your opponents battleships while yours stay afloat. You will start the"
    puts "game by placing your ships on the board vertically or horizontally and"
    puts "your opponent will do the same. Once the game starts you have to find"
    puts "your opponents ships by taking turns guessing a position till you get"
    puts "a hit."
    puts "\n\n\nThe first player to successfully sink all of their opponents ships wins!"
    puts "\n\nPress return to exit to the menu"
    input = get_response
    if input == ""
      game_start
    end
  end


end
game = Menu.new
# @board = Board.new
# binding.pry
game.game_start
