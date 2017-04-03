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




#FOLLOW AND UNFOLLOW PEOPLE
post '/:handle/follow' do
  user_to_follow = User.find_by(handle: params[:handle])
  Following.create(user: current_user, following_id: user_to_follow.id)
  redirect '/'
end

delete '/:handle/follow'  do
  user_to_unfollow = User.find_by(handle: params[:handle])
  Following.find_by(user: current_user, following_id: user_to_unfollow.id).destroy
  redirect '/'
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
  # p params
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

    if params[:profile_image]
    profile_image_hash = params[:profile_image]

    temp_file = profile_image_hash[:tempfile] # <Tempfile:/var/folders/_c/7cmjqt3d051475p3v8xl5dlr0000gn/T/..jpg>

    if @user.valid?
      if less_than_3mb?(temp_file)
        @user.save
        login_user
        # extra info good to know
        # filetype = profile_image_hash[:type] # "image/jpeg"
        # img_headers = profile_image_hash[:head] #the same info as above minus the tempfile
        filename = profile_image_hash[:filename] # "NBC_SNL_VANESSA_BAYER.jpg"
        copy_file(temp_file, filename)

        #need a migration to save the file location

        redirect '/'
        else
          @signup_errors[:profile_image] = ["Image cannot be greater than 3MB"]
        end
      else
        @signup_errors = @signup_errors.merge(@user.errors.messages)
        erb :'index'
      end
    end
  end
end

post '/logout' do
  logout_user
  redirect '/'
end
