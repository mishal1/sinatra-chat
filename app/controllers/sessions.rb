get '/sessions/new' do
  erb :sign_in
end

post '/sessions' do
  email, password = params[:email], params[:password]
  user = User.authenticate(email, password)
  if user
    session[:user_id] = user.id
    redirect to '/'
  else
    flash[:errors] = ['Incorrect credentials']
    erb :sign_in
  end
end
