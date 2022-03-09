feature 'Testing infrastructure' do
  scenario 'Can run app and check page content' do
    visit('/')
    expect(page).to have_content 'Welcome to Battle!'
  end

  scenario 'checking that the page has a button' do
    visit('/')
    expect(page).to have_button('Play')
  end

  scenario 'checking that the page has 2 blank boxes' do
    visit('/')
    expect(page).to have_field('player1')
    expect(page).to have_field('player2')
  end

  scenario 'Can input a player name ' do 
    sign_in_and_play
    expect(page).to have_content('Nico VS Chris')
  end

  context '/battleground route' do

    scenario 'can see player2 hit points' do 
      sign_in_and_play
      expect(page).to have_content('Chris: HP 10/10')
    end
    
    scenario 'can attack player2 and reduce their HP' do 
      sign_in_and_play
      click_on 'Attack'
      expect(page).to have_content('Chris: HP 9/10')
    end

  end
end