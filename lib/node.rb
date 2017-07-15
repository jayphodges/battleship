class Node
  attr_accessor :p1_hit,
                :p2_hit,
                :p1_ship,
                :p2_ship


  def initialize(node)
    @node = node
    @p1_hit = false
    @p2_hit = false
    @p1_ship = false
    @p2_ship = false
      # a1 = Node.new('a1'), a2 = Node.new('a2'), a3 = Node.new('a3'), a4 = Node.new('a4')
      # b1 = Node.new('b1'), b2 = Node.new('b2'), b3 = Node.new('b3'), b4 = Node.new('b4')
      # c1 = Node.new('c1'), c2 = Node.new('c2'), c3 = Node.new('c3'), c4 = Node.new('c4')
      # d1 = Node.new('d1'), d2 = Node.new('d2'), d3 = Node.new('d3'), d4 = Node.new('d4')
  end

  def icon?
    if @p1_hit && @p2_ship
      "\u26DD".encode('utf-8')
    elsif @p1_hit && !@p2_ship
      "M"
    else
      " "
    end
  end
end
