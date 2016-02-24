post '/sessions/login' do
  @user = User.authenticate(params[:email], params[:password_hash])

  if @user
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @error = "Incorrect email/password"
    erb :index
  end
end

get '/session-viewer' do
  session.inspect
end

delete '/sessions/:id' do
  session.clear
  redirect '/'
end