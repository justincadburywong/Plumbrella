get '/' do
  if current_user
    erb :'index'
  else
    redirect '/login'
  end
end
