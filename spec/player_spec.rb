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

  context '.attack' do
    it 'should attack another player' do
      player1 = Player.new('Chris')
      player2 = Player.new('Nico')
      expect(player2).to receive(:reduce_hp)
      player1.attack(player2)
    end
  end

  context '.reduce_hp' do
    it 'should return name of the player' do
      player = Player.new('Chris')
      player.reduce_hp
      expect(player.hit_points).to(eq(9))
    end
  end


end