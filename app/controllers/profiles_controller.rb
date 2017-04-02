# get '/' do
#   @user = User.find(current_user.id)
#   @tweets = @user.get_tweets_feed
#   erb :'show'
# end


# update '/like' do

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
