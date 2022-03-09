require 'game'

describe Game do

  context '.attack' do
    it 'should attack another player' do
      player_double = double(:playerdouble, :reduce_hp => 9)
      expect(player_double).to receive(:reduce_hp)
      subject.attack(player_double)
    end
  end
end
