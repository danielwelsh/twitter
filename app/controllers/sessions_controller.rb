get '/' do
  if current_user
    @tweets = current_user.get_landing_page_tweets
    @suggested_users = current_user.get_suggested_users
    erb :'users/index'
  else
    erb :'users/new'
  end
end

post '/login' do
  @user = User.find_by(handle: params[:handle])
  if @user && @user.authenticate(params[:password])
    login_user # redirects inside helper
  else
    @errors = {login: "Incorrect handle/password"}
    erb :index
  end
end

post '/signup' do
  @user = User.new(params[:user])
  @user.valid?
  password_input_validation = password_input_validation(params[:user][:password], params[:confirm_password])
  profile_image_input_validation = profile_image_input_validation(params)
  if @user.errors.messages.length > 0 || password_input_validation || profile_image_input_validation
    @errors = @user.errors.messages if @user.errors.messages.length > 0
    @errors = @errors.merge(password_input_validation) if password_input_validation
    @errors = @errors.merge(profile_image_input_validation) if profile_image_input_validation
    erb :'index'
  else
    @user.save
    upload_file(params, @user) if params[:profile_image]
    login_user
  end
end

post '/logout' do
  logout_user
end
