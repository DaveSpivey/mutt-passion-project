get 'mutts/:id/pictures/new' do
  @mutt = Mutt.find(params[:id])
  erb :"mutts/create_pic"
end

post 'mutts/:id/pictures' do
  p params
  root = APP_ROOT.to_s
  File.open(root + '/public/images/' + params['file'][:filename], "w") do |f|
    f.write(params['file'][:tempfile].read)
    @picture = Picture.new(url: "images/#{params['file'][:filename]}", mutt_id: params[:mutt_id])
    if @picture.save
      p "upload saved!"
    end
  end
  erb :"mutts/show"
end