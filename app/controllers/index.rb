get '/' do
  @mutts = Mutt.all
  if flash[:mutt_id]
    @mutt = Mutt.find(flash[:mutt_id])
    @breed = Breed.find(flash[:breed_id])
  else
    @mutt = Mutt.first
  end
  erb :index
end

