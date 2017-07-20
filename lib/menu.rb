require './lib/computer'
require './lib/board'
require './lib/box'
require './lib/ship'
require 'io/console'
require 'pry'

class Menu

  def initialize
    @board = Board.new
    @ship = Ship.new
    @cpu = Computer.new
    @p1_short = []
    @p1_medium = []
    @p2_short = []
    @p2_medium = []
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
    puts @board.p1_board
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
    puts @board.p1_board
    puts "\n\nEnter the squares for the two-unit ship:"
    input = get_response
    formatted_input = @ship.format_input(input)
    if formatted_input.count != 2
      puts "Incorrect number of coordinates"
      waiting
      two_unit_entry
    elsif !@ship.two_unit_adjacency(formatted_input)
      puts "Coordinates not adjacent"
      waiting
      two_unit_entry
    else
      puts "Coordinates accepted!"
      @p1_short = formatted_input
      @board.insert_p1_ship(@p1_short)
      three_unit_entry
    end
  end

  def three_unit_entry
    banner
    puts "\n\n"
    puts @board.p1_board
    puts "\n\nEnter the squares for the three-unit ship:"
    input = get_response
    formatted_input = @ship.format_input(input)
    if formatted_input.count != 3
      puts "Incorrect number of coordinates"
      waiting
      three_unit_entry
    elsif !@ship.three_unit_adjacency_letters(formatted_input) || !@ship.three_unit_adjacency_numbers(formatted_input)
      puts "Coordinates not adjacent"
      waiting
      three_unit_entry
    elsif ship_deintersector(formatted_input, @p1_short)
      puts "Ships intersect!"
      waiting
      three_unit_entry
    else
      puts "Completed!"
      @@p1_medium = formatted_input
      @board.insert_p1_ship(@@p1_medium)
      waiting
      computer_ship_placement
      game_play
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
    press_any_key
    intro_menu
    # input = get_response
    # if input == ""
    #   game_start
    # end
  end

  def game_play
    banner
    @board.print_board
    @board.p1_board
    puts "Select a coordinate to shoot"
    response = get_response
    input = response.downcase
    # binding.pry
    if input == "q"
      exit!
    elsif input == "c"
      puts "#{@p2_short} and #{@p2_medium}"
      sleep(2)
      game_play
    elsif input == "skip"
      computer_turn
    elsif !@board.position_available(input)
      # binding.pry
      puts "Invalid coordinate"
      waiting
      game_play
    elsif input.length != 2
      # binding.pry
      puts "Incorrect entry"
      waiting
      game_play
    else
      @board.insert_p1_hit(input)
      computer_ship_sinker(input)
    end
  end

  def computer_ship_placement
    @cpu.create_ships
    @p2_short = @cpu.short_ship
    @p2_medium = @cpu.medium_ship
    @board.insert_p2_ship(@p2_short)
    @board.insert_p2_ship(@p2_medium)
  end

  def player_ship_sinker(input)
    if @p1_short.include?(input)
      @p1_short.delete(input)
      if @p1_short.empty? && @p1_medium.empty?
        puts "They sank all your ships!!"
        binding.pry
        waiting
        game_over
      elsif @p1_short.empty?
        puts "They sank your destroyer!!"
        waiting
        game_play
      else
        game_play
      end
    elsif @p1_medium.include?(input)
      @p1_medium.delete(input)
      if @p1_medium.empty? && @p1_short.empty?
        puts "They sank all your ships!!"
        binding.pry
        game_over
      elsif @p1_medium.empty?
        puts "They sank your cruiser!!"
        waiting
        game_play
      else
        game_play
      end
    else
      game_play
    end
  end

  def computer_ship_sinker(input)
    # binding.pry
    if @p2_short.include?(input)
      @p2_short.delete(input)
      if @p2_short.empty? && @p2_medium.empty?
        puts "You sank all their ships!!"
        binding.pry
        waiting
        you_win
      elsif @p2_short.empty?
        puts "You sank their destroyer!!"
        waiting
        computer_turn
      else
        computer_turn
      end
    elsif @p2_medium.include?(input)
      @p2_medium.delete(input)
      if @p2_medium.empty? && @p2_short.empty?
        puts "You sank all their ships!!"
        binding.pry
        you_win
      elsif @p2_medium.empty?
        puts "You sank their cruiser!!"
        waiting
        computer_turn
      else
        computer_turn
      end
    else
      computer_turn
    end
  end

  def game_over
    puts "  _____                         ____                 "
    puts " / ____|                       / __ \\                "
    puts "| |  __  __ _ _ __ ___   ___  | |  | |_   _____ _ __ "
    puts "| | |_ |/ _` | '_ ` _ \\ / _ \\ | |  | \\ \\ / / _ \\ '__|"
    puts "| |__| | (_| | | | | | |  __/ | |__| |\\ V /  __/ |   "
    puts " \\_____|\\__,_|_| |_| |_|\\___|  \\____/  \\_/ \\___|_|   "
    exit!
  end

  def you_win
    puts "__     __          __          ___         _   _ "
    puts "\\ \\   / /          \\ \\        / (_)       | | | |"
    puts " \\ \\_/ /__  _   _   \\ \\  /\\  / / _ _ __   | | | |"
    puts "  \\   / _ \\| | | |   \\ \\/  \\/ / | | '_ \\  | | | |"
    puts "   | | (_) | |_| |    \\  /\\  /  | | | | | |_| |_|"
    puts "   |_|\\___/ \\__,_|     \\/  \\/   |_|_| |_| (_) (_)"
    exit!
  end

  def computer_turn
    input = @cpu.select_move
    @board.insert_p2_hit(input)
    puts "#{input}"
    sleep(3)
    player_ship_sinker(input)
  end

  def ship_deintersector(input1, input2)
    comparator = input1 & input2
    if comparator.empty?
      false
    else
      true
    end
  end

  def press_any_key
    print "press any key"
    STDIN.getch
    intro_menu
  end


end
game = Menu.new
cpu = Computer.new
game.game_start
