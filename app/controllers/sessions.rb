# aka "Login"
get '/login' do
  erb :'sessions/new'
end

post '/login' do
  #find user based on email address
  @user = User.find_by(email: params[:email])
  #validate user based on valid password
  #if it does
  #&& is checking if user is not nill !!
  if @user
    if @user.password == params[:password]
      #set the user-id to session
      session[:id] = @user.id
      redirect '/'
    else
      @error = "Your password or email was incorrect"
      erb :'/sessions/new'
    end
  else
    @error = "Email not found.  You need to sign up first"
    erb :'/users/new'
  end
end

get '/logout' do
  session[:id] = nil
  current_user = nil
  redirect '/'
end
