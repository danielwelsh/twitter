get '/' do
  if current_user
    @tweets = get_tweets_feed(current_user)
    @suggested_users = current_user.get_not_following_users
    p '*' * 100
    p @suggested_users
    erb :'show'
  else
    @user = User.new()
    if params[:error_type]
      @login_error = 'Incorrect handle/password.'
    end
    erb :index
  end
end

post '/login' do
    @user = User.find_by(handle: params[:handle])
  if @user && @user.authenticate(params[:password])
    login_user
    redirect '/'
  else
    redirect '/?error_type=login'
  end
end

post '/signup' do
  @user = User.new(params[:user])
  @user.valid?
  @signup_errors = {}
  password_input_validation = password_input_validation(params[:user][:password], params[:confirm_password])
  profile_image_input_validation = profile_image_input_validation(params)
  if @signup_errors.length > 0 || profile_image_input_validation || @user.errors.messages.length > 0 || password_input_validation
    @signup_errors = @user.errors.messages
    @signup_errors = @signup_errors.merge(password_input_validation) if password_input_validation
    @signup_errors = @signup_errors.merge(profile_image_input_validation) if profile_image_input_validation
    erb :'index'
  else
    @user.save
    login_user
    copy_file(params) if params[:profile_image]
    redirect '/'
  end
end

post '/logout' do
  logout_user
  redirect '/'
end
