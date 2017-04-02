get '/' do
  if current_user
    @tweets = get_tweets_feed(current_user)
    erb :'show'
  else
    if params[:error_type]
      @login_error = 'Incorrect handle/password.'
    else
      @signup_errors = 'blah'
      #error logic for sign ups
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
  @user = User.find_by(handle: params[:user][:handle])
  # if
end

post '/logout' do
  logout_user
  redirect '/'
end
