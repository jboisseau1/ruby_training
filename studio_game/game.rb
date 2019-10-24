require_relative "player"
require_relative "game_turn"

class Game
  attr_reader :title
  def initialize(name)
    @title = name
    @players = []
  end

  def load_players(from_file)
    File.readlines(from_file).each do |line|
      add_player(Player.from_csv(line))
    end
  end

  def save_high_scores(to_file='highscores.txt')
    File.open(to_file, "w") do |file|
      file.puts "#{@title} High Scores:"
      @players.sort.each do |player|
        high_score_entry(player)
      end
    end

  end

  def high_score_entry(player)
    formatted_name = player.name.ljust(20, '.')
    "#{formatted_name} #{player.score}"
  end

  def add_player(player)
    @players << player
  end

  def print_stats
    puts "\n#{@title}'s High Scores:"
    @players.sort.each do |player|
      high_score_entry(player)
    end
    @players.each do |player|
      puts "\n#{player.name}'s point totals:"
      player.each_found_treasure { |treasure| puts "#{treasure.points} total #{treasure.name} points" }
      puts "#{player.points} grand total points"
    end
  end

  def play(rounds)
    puts "There are #{@players.size} players in #{@title}: "
    treasures = TreasureTrove::TREASURES
    puts "\nThere are #{treasures.size} treasures to be found:"
    treasures.each do |treasure|
      puts "A #{treasure.name} is worth #{treasure.points} points"
    end
    puts "\n"
    1.upto(rounds) do |round_num|
      puts "Starting round #{round_num}:"
      @players.each do |player|
      GameTurn.take_turn(player)
      puts player
      end
    end
end
end
