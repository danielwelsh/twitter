#TWEET
post '/tweets/create' do
  @tweet = Tweet.new(user: current_user, tweet: params[:tweet])
  if @tweet.save
    redirect "/"
  else
    @errors = @tweet.errors.full_messages
    erb :'show'
  end
end


#LIKE
post '/tweets/:tweet_id/like' do
  LikedTweet.create(user: current_user, tweet_id: params[:tweet_id])
  redirect '/'
end

delete '/tweets/:tweet_id/like' do
  liked_tweet = LikedTweet.find_by(user: current_user, tweet_id: params[:tweet_id]).destroy
  redirect '/'
end


#RETWEET
post '/tweets/:tweet_id/retweet' do
  #Create a new tweet and a retweet object
  original_tweet = Tweet.find(params[:tweet_id])
  Retweet.create(user: current_user, tweet: original_tweet, original_tweet_id: original_tweet.id)
  redirect '/'

end

delete '/tweets/:tweet_id/retweet' do
  Retweet.find_by(user: current_user, tweet: Tweet.find(params[:tweet_id])).destroy
end




#LIKERS
get 'tweets/:tweet_id/likers' do

end



#REPLY
post 'tweets/:tweet_id/reply' do

end

#FOLLOW AND UNFOLLOW PEOPLE
post '/:handle/follow' do
  user_to_follow = User.find_by(handle: params[:handle])
  Following.create(user: current_user, following_id: user_to_follow.id)
  Follower.create(user: user_to_follow, follower_id: current_user.id)
  redirect '/'
end

delete '/:handle/follow'  do
  user_to_unfollow = User.find_by(handle: params[:handle])
  Following.find_by(user: current_user, following_id: user_to_unfollow.id).destroy
  Follower.find_by(user: user_to_follow, follower_id: current_user.id).destroy
  redirect '/'
end


