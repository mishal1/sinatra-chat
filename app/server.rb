require 'sinatra'
require 'data_mapper'
require 'rack-flash'

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
use Rack::Flash

get '/' do
  erb :index
end

get '/users/new' do
  @user = User.new
  erb :sign_in
end

post '/users' do
  @user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
  if @user.save
    session[:user_id] = user.id
    redirect to '/'
  else
    flash[:notice] = 'Sorry, your passwords do not match'
    erb :sign_in
  end
end
