class Chat < Sinatra::Base
  
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
      flash.now[:errors] = ['Incorrect credentials']
      erb :sign_in
    end
  end

  post '/sessions/delete' do
    session[:user_id] = nil
    redirect to('/')
  end
end
