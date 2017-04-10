get '/:handle' do
  @user = User.find_by(handle: params[:handle])
  @tweets = @user.get_profile_page_tweets
  @suggested_users = @user.get_suggested_users
  erb :'users/show'
end


post '/hover/:handle' do
  @user = User.find_by(handle: params[:handle])
  if request.xhr?
    erb :'users/_hover_profile', layout:false, locals: {current_user: @user}
  end
end


#ROUTE THAT TAKES USER TO HOME PROFILE PAGE


get '/:handle/followers' do
  @users = User.find(current_user.id).following_users
  if request.xhr?
    erb :'/users/_list_users', layout: false
  else
    erb :'/users/_list_users'
  end
end


get '/:handle/followings' do
  @users = User.find(current_user.id).followed_users
  if request.xhr?
    erb :'/users/_list_users', layout: false
  else
    erb :'/users/_list_users'
  end
end




















































