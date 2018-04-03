get '/upload' do
  erb :'photos/new'
end

post '/upload' do
  # all the magic
  @files = params[:img]
  @filename = params[:img][:filename]
  file = params[:img][:tempfile]
  # @filename.each {|x| p x }
  p @files
  p @filename
  redirect '/upload'
end
