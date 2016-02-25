get '/mutts/:mutt_id/pictures/new' do
  @mutt = Mutt.find(params[:mutt_id])
  erb :"mutts/create_pic"
end

post '/mutts/:mutt_id/pictures' do
  p params
  root = APP_ROOT.to_s
  File.open(root + '/public/images/' + params['file'][:filename], "w") do |f|
    f.write(params['file'][:tempfile].read)
    @picture = Picture.new(url: "images/#{params['file'][:filename]}", mutt_id: params[:mutt_id])
    if @picture.save
      p "upload saved!"
    end
  end
  redirect "/mutts/#{params[:mutt_id]}"
end