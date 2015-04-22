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
