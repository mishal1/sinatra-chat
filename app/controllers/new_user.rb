get '/users/new' do
  @user = User.new
  erb :sign_in
end

post '/users' do
  @user = User.create(email: params[:email],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation])
  if @user.save
    session[:user_id] = user.id
    redirect to '/'
  else
    flash[:errors] = @user.errors.full_messages
    erb :sign_in
  end
end
