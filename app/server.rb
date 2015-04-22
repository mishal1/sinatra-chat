require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require_relative './datamapper_setup'
require_relative './controllers/helper'
require_relative './controllers/new_user'

enable :sessions
set :session_secret, 'super secret'
use Rack::Flash

get '/' do
  erb :index
end

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
