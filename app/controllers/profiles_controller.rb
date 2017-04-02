before do
  if !current_user
    erb :'index.erb'
  end
end

get '/' do
  @user = User.find(current_user.user_id)
  @tweets = @user.get_tweets_feed
  erb :'show.erb'
end


put '/like' do
  @user = User.find(params[:user_id])
  @tweet = Tweet.find(params[:tweet_id])
end

put '/reply' do
  @user = User.find(params[:user_id])
end

put '/retweet' do
  @user = User.find(params[:user_id])
end