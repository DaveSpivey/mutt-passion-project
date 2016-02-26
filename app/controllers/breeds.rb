get '/mutts/:mutt_id/breeds' do
  @mutt = Mutt.find(params[:mutt_id])
  @breeds = Breed.where(mutt_id: nil)
  if request.xhr?
    erb :"mutts/_breeds", layout: false, locals: {mutt_id: params[:mutt_id]}
  else
    erb :"mutts/breeds"
  end
end

post '/mutts/:mutt_id/breeds' do
  @mutt = Mutt.find(params[:mutt_id])
  @breed = Breed.find(params[:breed_id])
  @guess = Breed.new(mutt_id: params[:id], name: @breed.name, user_id: current_user.id, link: @breed.link, value: 1)
  @mutt.breeds << @guess
  if @guess.save
    flash[:mutt_id] = params[:mutt_id]
    flash[:breed_id] = @guess.id
    redirect '/'
  else
    flash[:error]
    redirect '/'
  end
end

get '/mutts/:mutt_id/breeds/search' do
  @breed = Breed.where("name like ?", "%#{params[:query].capitalize}%")[0]

  if request.xhr?
    if @breed
      erb :"mutts/_search", layout: false, locals: {mutt_id: params[:mutt_id], breed_name: @breed.name, breed_id: @breed.id}
    else
      content_type :json
      {result: "no results"}.to_json
    end
  else
    flash[:error]
    redirect '/'
  end
end