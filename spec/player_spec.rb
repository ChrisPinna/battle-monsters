require 'player'

describe Player do

  it 'should return name of the player' do
    player = Player.new('Chris')
    expect(player.name).to(eq("Chris"))
  end
end