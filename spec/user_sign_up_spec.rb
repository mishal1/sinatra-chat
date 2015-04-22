feature 'The sign up process' do
  scenario 'when being a new user visiting the site' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, m@m.com')
  end

  scenario 'with a password that does not match' do
    expect { sign_up('random') }.to change(User, :count).by(0)
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario 'with an email that is not unique' do
    sign_up
    expect { sign_up }.to change(User, :count).by(0)
    expect(page).to have_content('This email is already taken')
  end

  def sign_up(password_confirmation = 'password',
              email = 'm@m.com',
              password = 'password')
    visit '/'
    click_link 'Sign up'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end
end
