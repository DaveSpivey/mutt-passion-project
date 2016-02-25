get "/mutts/new" do
  erb :"mutts/new"
end

get '/mutts/:id' do
  @mutt = Mutt.find(params[:id])
  counter = 0
  while @mutt.pictures.length == 0
    @mutt = Mutt.where("id > ?", params[:id]).first
    counter += 1
    break if counter == 5
  end

  if request.xhr?
    erb :"mutts/_show", layout: false, locals: { mutt_id: @mutt.id, mutt_pic: @mutt.pictures.first.url}
  else
    erb :"mutts/show"
  end
end

post '/mutts' do
  mutt = Mutt.new(name: params[:name], owner_id: current_user.id)
  if mutt.save
    redirect "users/#{current_user.id}"
  else
    flash[:mutt_error] = "Error - Mutt couldn't be created"
    redirect "users/#{current_user.id}"
  end
end