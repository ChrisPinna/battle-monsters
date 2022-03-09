feature 'Testing infrastructure' do
  scenario 'Can run app and check page content' do
    visit('/')
    expect(page).to have_content 'Welcome to Battle!'
  end

  scenario 'checking that the page has a button' do
    visit('/')
    expect(page).to have_button('Submit')
  end

  scenario 'checking that the page has 2 blank boxes' do
    visit('/')
    expect(page).to have_field('player1')
    expect(page).to have_field('player2')
  end

  scenario 'Can input a player name ' do 
    visit('/')
    fill_in('player1' , with: 'Nico')
    fill_in('player2' , with: 'Chris')
    click_on('Submit')
    expect(page).to have_content('Nico VS Chris')
  end
end