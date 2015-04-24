feature 'User signs in' do
  before(:each) do
    User.create(email: 'm@m.com',
                password: 'password',
                password_confirmation: 'password')
  end

  scenario 'with correct credentials' do
    visit '/'
    expect(page).not_to have_content('Welcome, m@m.com')
    sign_in
    expect(page).to have_content('Welcome, m@m.com')
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

  def sign_in(email = 'm@m.com',
              password = 'password')
    visit '/'
    click_link 'Sign in'
    fill_in 'email', with: email
    fill_in 'password', with: password
    click_button 'Sign in'
  end
end
