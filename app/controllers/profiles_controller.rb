# get '/' do
#   @user = User.find(current_user.id)
#   @tweets = @user.get_tweets_feed
#   erb :'show'
# end


# update '/like' do


#CREATE
post '/tweets/create' do
  Tweet.create(params[:tweet])
  redirect '/'
end


#REPLY
post '/tweets/:tweet_id/reply' do
  @tweet = Tweet.find(params[:tweet])
  redirect '/'
end


#LIKE
post '/tweets/:tweet_id/like' do
  @tweet = Tweet.find(:tweet_id)
  likes = @tweets.likes
  @tweet.update(likes: (likes + 1))
  redirect '/'
end

#RETWEET
post '/tweets/:tweet_id/retweet' do
  @tweet = Tweet.find(:tweet_id)

  #Recreates that same tweet for a person.
  new_tweet = Tweet.create(user_id: current_user.id, tweet: @tweet.tweet, replied_to_id: @tweet)
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


