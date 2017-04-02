get '/' do
  if current_user
    p "-" * 25
    @tweets = get_tweets_feed(current_user)
    p "-" * 25
    erb :'show'
  else
    p "*" * 25
    @user = User.new()
    p "*" * 25
    if params[:error_type]
      @login_error = 'Incorrect handle/password.'
    end
    erb :index
  end
end

post '/login' do
    @user = User.find_by(handle: params[:handle])
  p @user
  if @user && @user.authenticate(params[:password])
    login_user
    redirect '/'
  else
    redirect '/?error_type=login'
  end
end

post '/signup' do
  @signup_errors = {}
  @user = User.find_by(handle: params[:user][:handle])

  if @user
    @user = User.new(params[:user])
    @signup_errors = "A twitter account with that handle already exists"
    erb :'index'
  else
    @user = User.new(params[:user])
    if params[:user][:password] == "" and params["password-confirm"] == ""
      @signup_errors[:password] = ["Password fields cannot be blank"]
    end
    if params[:user][:password] != params["password-confirm"]
      @signup_errors[:password] = ["Passwords don't match"]
    end
    if @user.save
      login_user
      redirect '/'
    else
      @signup_errors = @signup_errors.merge(@user.errors.messages)
      erb :'index'
    end
  end
end

post '/logout' do
  logout_user
  redirect '/'
end
