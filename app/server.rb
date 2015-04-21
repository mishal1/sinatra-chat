require 'sinatra'
require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/twitter_#{env}")
require_relative './models/user.rb'

DataMapper.finalize
DataMapper.auto_upgrade!

helpers do
  def current_user
    @current_user ||= User.get(session[:user_id]) if session[:user_id]
  end
end

enable :sessions
set :session_secret, 'super secret'

get '/' do
  erb :index
end

get '/users/new' do
  erb :sign_in
end

post '/users' do
  user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
  session[:user_id] = user.id
  redirect to '/'
end
