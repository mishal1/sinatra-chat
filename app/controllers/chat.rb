require 'json'

class App < Sinatra::Base
  get '/chat' do
    if current_user
      if !request.websocket?
        erb :chat
      else
        request.websocket do |ws|
          ws.onopen do
            puts 'open'
            EM.next_tick { settings.sockets.each { |s| s.send({name: current_user.name, message: ' has joined the room'}.to_json) } }
            settings.sockets << ws
          end
          ws.onmessage do |msg|
            puts msg
            EM.next_tick { settings.sockets.each { |s| s.send({name: current_user.name, message: msg}.to_json) } }
          end
          ws.onclose do
            puts 'closed'
            EM.next_tick { settings.sockets.each { |s| s.send({name: current_user.name, message: ' has left the room'}.to_json) } }
            settings.sockets.delete(ws)
          end
        end
      end
    else
      redirect '/'
    end
  end
end
