class Box
  attr_accessor :p1_hit,
                :p2_hit,
                :p1_ship,
                :p2_ship


  def initialize
    @p1_hit = false
    @p2_hit = false
    @p1_ship = false
    @p2_ship = false

  end

  def icon?
    if @p1_hit && @p2_ship
      "H"
      # "\u26DD".encode('utf-8')
    elsif @p1_hit && !@p2_ship
      "M"
    else
      " "
    end
  end

  def p1_map
    if @p1_ship && @p2_hit
      # U+20E3 big square
      # U+220E
      # "\u220es".encode('utf-8')
      "X"
    elsif @p1_ship
      "#"
    elsif @p2_hit
      "O"
    else
      " "
    end
  end
end
