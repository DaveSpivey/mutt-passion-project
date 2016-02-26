get "/mutts/new" do
  erb :"mutts/new"
end

get '/mutts/:id' do
  @mutt = Mutt.find(params[:id])
  counter = 0
  p "$" * 80
  p @mutt.name

  if @mutt
    if params[:nav]
      while @mutt.pictures.length == 0
        if params[:nav] == "next"
          @mutt = Mutt.where("id > ?", params[:id]).first
        else
          @mutt = Mutt.where("id < ?", params[:id]).last
        end
        counter += 1
        break if counter == 5
      end
    end

    if request.xhr?
      erb :"mutts/_show", layout: false, locals: { mutt: @mutt, guess: nil }
    else
      erb :"mutts/show"
    end
  else
    p "%" * 80
    p "I DUNNO"
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