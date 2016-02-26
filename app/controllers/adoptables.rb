get '/adoptables' do
  erb :"adoptables/new"
end

post '/adoptables' do
  petfinder = Petfinder::Client.new(ENV['PET_KEY'], ENV['PET_SECRET'])

  local_pets = petfinder.find_pets('dog', params[:zip])
  # shelter_id = local_pets.first.shelterid
  # @shelter = petfinder.shelter(shelter_id)


  @pets = local_pets.select do |pet|
    pet.breeds.include? params[:breed]
  end
  p @pets

  erb :"adoptables/show"
end