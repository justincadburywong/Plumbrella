# aka Register
get '/signup' do
  erb :'users/new'
end

post '/signup' do
  if params[:password] == params[:password2]
      @user = User.new(email: params[:email], password: params[:password])
      if @user.save
        # log them in!
        session[:id] = @user.id
        redirect '/'
      else
        #error handling goes here
        @error = "Sorry, that email is already taken.  Please try again."
        erb :'/users/new'
      end
    else
      @error = "Your passwords don't match!  Please try again!"
      erb :'/users/new'
    end
end

#aka Profile page
get '/account/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end
