feature 'User chats' do
  scenario 'when a user is not signed in, they are redirected to homepage' do
    visit '/chat'
    expect(page.current_path).to eq('/')
  end

  scenario 'user visits chat page', js: true do
    sign_up('password', '1', 'password')
    click_link 'Chat'
  end
end
