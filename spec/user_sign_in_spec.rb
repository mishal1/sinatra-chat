feature 'User signs in' do
  before(:each) do
    sign_up
    click_button 'Sign out'
  end

  scenario 'with correct credentials' do
    visit '/'
    expect(page).not_to have_content('Welcome, Mishal')
    sign_in
    expect(page).to have_content('Welcome, Mishal')
  end

  scenario 'with incorrect credentials' do
    visit '/'
    expect(page).not_to have_content('Welcome, m@m.com')
    sign_in('wrong@email.com')
    expect(page).to have_content('Incorrect credentials')
  end

  scenario 'can sign out' do
    sign_in
    click_button 'Sign out'
    expect(page).not_to have_content('Sign out')
    expect(page).to have_content('Sign up Sign in')
  end
end
