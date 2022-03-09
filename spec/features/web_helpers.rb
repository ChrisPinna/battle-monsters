def sign_in_and_play
  visit('/')
  fill_in('player1' , with: 'Nico')
  fill_in('player2' , with: 'Chris')
  click_on('Submit')
end