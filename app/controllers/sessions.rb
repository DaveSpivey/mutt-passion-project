get '/session-viewer' do
  session.inspect
end

get '/logout' do
  session.clear
  redirect '/'
end