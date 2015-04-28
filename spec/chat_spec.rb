feature 'User chats' do
  scenario 'when a user is not signed in, they are redirected to homepage' do
    visit '/chat'
    expect(page.current_path).to eq('/')
  end
end
