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
end
