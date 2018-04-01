get '/' do
  # if current_user
    erb :'index'
  # else
    # redirect '/sessions/new'
  # end
end
