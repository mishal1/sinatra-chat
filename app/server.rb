require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'
require_relative './datamapper_setup'
require_relative './controllers/helper'
require_relative './controllers/homepage'
require_relative './controllers/users'
require_relative './controllers/sessions'

class Chat < Sinatra::Base
  set :views, proc { File.join(root, '..', 'views') }
  set :public, proc { File.join(root, '..', '../public') }

  run! if app_file == $PROGRAM_NAME
end
