require_relative 'treasure_trove'
require_relative 'playable'

class Player
  include Playable
  attr_reader :health
  attr_accessor :name
  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
    @found_treasures = Hash.new(0)
  end

  def self.from_csv(string)
    name, health = string.split(',')
    Player.new(name, Integer(health))
  end

  def score
    @health + @name.length
  end

  def points
    @found_treasures.values.reduce(0,:+)

  end

  def each_found_treasure()
    @found_treasures.each { |k,v| yield Treasure.new(k,v) }
  end

  def found_treasures(treasure)
    @found_treasures[treasure.name] += treasure.points
    puts "A #{treasure.name} is worth #{treasure.points} points"
    puts "#{@name}'s treasures: #{@found_treasures}"
  end

  def <=>(other_player)
    other_player.score <=> self.score
  end

  def to_s
    "I'm #{@name} with a health = #{@health}, points = #{points}, score = #{score}."
  end

end
