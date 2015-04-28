require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'
require 'tilt/erb'
require 'sinatra-websocket'
require_relative './controllers/helper'
require_relative './controllers/homepage'
require_relative './controllers/users'
require_relative './controllers/sessions'
require_relative './controllers/chat'
require_relative './datamapper_setup'

class App < Sinatra::Base
  set :server, 'thin'
  set :sockets, []
  set :views, proc { File.join(root, '..', 'views') }
  set :public_dir, proc { File.join(root, '..', '../public') }
  enable :sessions
  set :session_secret, 'super secret'
  use Rack::Flash
end
