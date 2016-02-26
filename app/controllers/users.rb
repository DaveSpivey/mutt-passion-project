get '/users/new' do
  erb :"users/new"
end

post '/users' do
  new_user = User.new(params[:user])

  if new_user.save
    session[:id] = new_user.id
    redirect "/users/#{new_user.id}"
  else
    @error = "Error - invalid info"
    erb :"users/new"
  end
end

get '/users/:id' do
  erb :"users/show"
end