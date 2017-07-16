require './lib/ai'
require './lib/board'
require './lib/box'
require './lib/ships'
require 'pry'

class Battleship

  def initialize
    @board = Board.new
  end

  def banner
    system "clear"
    puts " ____        _   _   _       _____ _     _       "
    puts "|  _ \\      | | | | | |     / ____| |   (_)      "
    puts "| |_) | __ _| |_| |_| | ___| (___ | |__  _ _ __  "
    puts "|  _ < / _` | __| __| |/ _ \\\\___ \\| '_ \\| | '_ \\ "
    puts "| |_) | (_| | |_| |_| |  __/____) | | | | | |_) |"
    puts "|____/ \\__,_|\\__|\\__|_|\\___|_____/|_| |_|_| .__/ "
    puts "                                          | |    "
    puts "                                          |_|  "
  end

  def game_start
    banner
    intro_menu
  end

  def intro_menu
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    input = get_response
    case input
      when "p" || "P"
        binding.pry
        intro_menu
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
    system "clear"
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    puts "Welcome to the game of BattleShip! The purpose of the game is to sink"
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
game = Battleship.new
game.game_start
