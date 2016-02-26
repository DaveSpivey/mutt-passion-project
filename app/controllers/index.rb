get '/' do
  @mutts = Mutt.all
  @pictures = Picture.all
  if flash[:mutt_id]
    @mutt = Mutt.find(flash[:mutt_id])
    @breed = Breed.find(flash[:breed_id])
  else
    @mutt = Mutt.first
  end
  if flash[:error]
    @error = flash[:error]
  end
  erb :index
end

