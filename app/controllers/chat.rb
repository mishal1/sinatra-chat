class App < Sinatra::Base
  get '/chat' do
    if current_user
      if !request.websocket?
        erb :chat
      else
        request.websocket do |ws|
          ws.onopen do
            puts 'open'
            settings.sockets << ws
          end
          ws.onmessage do |msg|
            puts msg
            EM.next_tick { settings.sockets.each { |s| s.send(msg) } }
          end
          ws.onclose do
            puts 'closed'
            settings.sockets.delete(ws)
          end
        end
      end
    else
      redirect '/'
    end
  end
end
