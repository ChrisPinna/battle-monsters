require 'game'

describe Game do

  context '.new' do
    it 'should create a new game instance with two players' do
      expect(Game).to respond_to(:new).with(2).arguments
    end
  end
  context '.attack' do

    it 'should attack another player' do
      player1_double = double(:player1_double, :reduce_hp => 9)
      player2_double = double(:player2_double)
      game = Game.new(player1_double, player2_double)
      expect(player1_double).to receive(:reduce_hp)
      game.attack(player1_double)
    end
  end
end
