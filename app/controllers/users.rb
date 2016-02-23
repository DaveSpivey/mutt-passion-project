get '/users/new' do
  erb :"users/new"
end

post '/users/new' do
  new_user = User.new(params[:user])

  if new_user.save
    session[:id] = new_user.id
    redirect "/users/#{new_user.id}"
  else
    @error = "Error - invalid info"
    erb :"users/new"
  end
end

post '/users/login' do
  @user = User.authenticate(params[:email], params[:password_hash])

  if @user
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @error = "Incorrect email/password"
    erb :index
  end
end

get '/users/:id' do
  @user = User.find_by(id: session[:id])
  erb :"users/show"
end