require_relative "game"
require_relative 'clumsy_player'
require_relative 'berserk_player'

knuckleheads = Game.new("Knuckleheads")

knuckleheads.load_players(ARGV.shift || "players.csv")



berserker = BerserkPlayer.new("berserker", 50)
klutz = ClumsyPlayer.new("klutz", 105)

knuckleheads.add_player(berserker)
knuckleheads.add_player(klutz)
loop do
  puts "\nHow many game rounds? ('quit' to exit)"
  answer = gets.chomp.downcase
  case answer
  when /^\d+$/
    knuckleheads.play(answer.to_i)
  when 'quit', 'exit', 'q'
    knuckleheads.print_stats
    break
  else
    puts "Please enter a number or 'quit'"
  end
end

knuckleheads.save_high_scores
