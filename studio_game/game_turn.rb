require_relative "loaded_die"
module GameTurn
  def self.take_turn(player)
    die = LoadedDie.new
    case die.roll
    when 1..2
      player.blam
    when 3..4
      puts "#{player.name} was skipped."
    else
      player.w00t
    end
    treasure = TreasureTrove.random
    player.found_treasures(treasure)
  end

end
