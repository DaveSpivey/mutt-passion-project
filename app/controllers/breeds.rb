get '/mutts/:mutt_id/breeds' do
  @mutt = Mutt.find(params[:mutt_id])
  @breeds = Breed.all
  if request.xhr?
    erb :"mutts/_breeds", layout: false, locals: {mutt_id: params[:mutt_id]}
  else
    erb :"mutts/breeds"
  end
end

post '/mutts/:mutt_id/breeds' do
  @mutt = Mutt.find(params[:mutt_id])
  @breed = Breed.find(params[:breed_id])
  @breed.value = 1
  @mutt.breeds << @breed
  flash[:mutt_id] = params[:mutt_id]
  flash[:breed_id] = params[:breed_id]
  redirect '/'
end