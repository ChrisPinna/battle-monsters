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

  context '/player1turn route' do

    scenario 'can see player1 hit points' do 
      sign_in_and_play
      expect(page).to have_content('Nico: HP 10/10')
    end

    scenario 'can see player2 hit points' do 
      sign_in_and_play
      expect(page).to have_content('Chris: HP 10/10')
    end
    
    scenario 'can attack player2 and read message' do 
      sign_in_and_play
      click_on 'Attack'
      expect(page).to have_content('Nico has attacked Chris')
    end

    scenario 'can attack player2 and reduce their HP' do 
      sign_in_and_play
      click_on 'Attack'
      expect(page).to have_content('Chris: HP 9/10')
    end

  end

  context '/player2turn route' do
    scenario 'can see player2 hit points' do 
      sign_in_and_play
      click_on 'Attack'
      click_on "Chris's Turn"
      expect(page).to have_content('Chris: HP 9/10')
    end
  end

  context 'plays a few turns' do
    scenario 'can see player2 hit points' do 
      sign_in_and_play
      click_on 'Attack'
      click_on "Chris's Turn"
      click_on 'Attack'
      click_on "Nico's Turn"
      expect(page).to have_content('Chris: HP 9/10')
    end
  end

  context 'shows player 2 win message' do
    scenario 'can see player2 hit points' do 
      sign_in_and_play
      9.times do
        click_on 'Attack'
        click_on "Chris's Turn"
        click_on 'Attack'
        click_on "Nico's Turn"
      end
      click_on 'Attack'
      expect(page).to have_content('Nico Wins!')
    end
  end

end