get '/' do
  @mutts = Mutt.all
  @mutt = Mutt.first
  erb :index
end

