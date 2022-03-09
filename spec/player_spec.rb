require 'player'

describe Player do

  it 'should return name of the player' do
    player = Player.new('Chris')
    expect(player.name).to(eq("Chris"))
  end

  it 'should return the default HP' do
    player = Player.new('Chris')
    expect(player.hit_points).to(eq(Player::DEFAULT_HP))
  end

  context '.reduce_hp' do
    it 'should return name of the player' do
      player = Player.new('Chris')
      player.reduce_hp
      expect(player.hit_points).to(eq(9))
    end
  end


end