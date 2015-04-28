feature 'The sign up process' do
  scenario 'when being a new user visiting the site' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Mishal')
  end

  scenario 'with a password that does not match' do
    expect { sign_up('random') }.to change(User, :count).by(0)
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario 'with an email that is not unique' do
    sign_up
    click_button 'Sign out'
    expect { sign_up }.to change(User, :count).by(0)
    expect(page).to have_content('This email is already taken')
  end
end
