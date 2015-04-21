describe User do
  
  it 'can be created' do
    expect(User.count).to eq(0)
    User.create(email: 'm@m.com')
    expect(User.count).to eq(1)
  end

  it 'can retrie email from the db' do
    User.create(email: 'm@m.com')
    user = User.first
    expect(user.email).to eq('m@m.com')
  end

end