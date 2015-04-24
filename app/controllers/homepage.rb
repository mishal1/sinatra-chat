class Chat < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  use Rack::Flash

  get '/' do
    erb :index
  end
end
