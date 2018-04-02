# aka Register
get '/signup' do
  erb :'users/new'
end

post '/signup' do
  @user = User.new(username: params[:username], password: params[:password])
  if @user.save
    # this will auto log in the user after creating an account
    # session[:id] = @user.id
    redirect '/'
  else
    #error handling goes here
    @errors = "Email or Username already taken.  Please try again."
    erb :users
  end
end

#aka Profile page
get '/account/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end
