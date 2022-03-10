class Game

  attr_reader :player1, :player2
  attr_accessor :player1turn

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @player1turn = nil
  end

  def attack(player)
    player.reduce_hp
  end
end