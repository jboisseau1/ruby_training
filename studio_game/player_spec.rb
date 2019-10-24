require_relative 'player'

describe Player do

  before do
    @player = Player.new("larry", 150)
  end

  it "has a capitalized name" do
    expect(@player.name).to eq("Larry")
  end
  it "has an initial health" do
    initial_health = 99
    player = Player.new("larry", initial_health)

    expect(player.health).to eq(initial_health)
  end

  it "has a string representation" do
    expect(@player.to_s).to eq("I'm Larry with a health of 150 and a score of 155.")
  end

  it "computes a score as the sum of its health and length of name" do
    score = @player.name.length + @player.health
    expect(@player.score).to eq(score)
  end

  it "increases health by 15 when w00ted" do
    expected_player_health = @player.health + 15
    @player.w00t
    expect(@player.health).to eq(expected_player_health)
  end

  it "decreases health by 10 when blammed" do
    expected_player_health = @player.health - 10
    @player.blam
    expect(@player.health).to eq(expected_player_health)
  end

end
