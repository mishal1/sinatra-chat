class App < Sinatra::Base
  get '/users/new' do
    @user = User.new
    erb :sign_up
  end

  post '/users' do
    @user = User.create(email: params[:email],
                        name: params[:name],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :sign_up
    end
  end
end
