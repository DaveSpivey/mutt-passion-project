get '/' do
  erb :index
end

post '/upload' do
  p params
  File.open('uploads/' + params['file'][:filename], "w") do |f|
    f.write(params['file'][:tempfile].read)
    @picture = Picture.new(url: "/uploads/#{params['file'][:filename]}", mutt_id: params[:mutt_id])
    if @picture.save
      p "upload saved!"
    end
  end
end

# post '/upload' do
#   p params
#   unless params[:file] &&
#          (tmpfile = params[:file][:tempfile]) &&
#          (name = params[:file][:filename])
#     @error = "No file selected"
#     # return haml(:upload)
#     erb :show
#   end
#   STDERR.puts "Uploading file, original name #{name.inspect}"
#   while blk = tmpfile.read(65536)
#     # here you would write it to its final location
#     @picture = Picture.new(mutt_id: params[:mutt_id])
#     if @picture.save
#       p "upload saved!"
#     end
#     STDERR.puts blk.inspect
#   end
#   "Upload complete"
#   erb :pictest
# end