require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @p1   = name1
    @p2   = name2
    @cups = Array.new (14) { Array.new }
    
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each do |cup|
      4.times { cup << :stone }
    end

    @cups[6], @cups[13] = [], []
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(0,12)
    
    raise "Starting cup is empty" if @cups[start_pos].empty?
    
    true
  end

  def make_move(start_pos, current_player_name)
    i       = start_pos
    p1_turn = (@p1 == current_player_name)
    p2_turn = (@p2 == current_player_name)

    until @cups[start_pos].empty?
      i = (i + 1) % 14 

      next if (p1_turn && i == 13) || (p2_turn && i == 6)

      @cups[i] << @cups[start_pos].pop
    end

    render
    next_turn(i)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    
    return :prompt if [6, 13].include?(ending_cup_idx)

    return :switch if @cups[ending_cup_idx].count == 1

    ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    p1_side = @cups[0..5]
    p2_side = @cups[7..12]

    p1_side.all?(&:empty?) || p2_side.all?(&:empty?)
  end

  def winner
    p1_score = @cups[6].count
    p2_score = @cups[13].count

    return :draw if p1_score == p2_score

    (p1_score > p2_score) ? @p1 : @p2
  end
end

# board = Board.new("Erica", "James")
# board.make_move(0, "Erica")
# debugger
# board.make_move(9, "James")