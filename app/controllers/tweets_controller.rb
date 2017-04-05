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
  #for query efficiency
  Tweet.find(params[:tweet_id]).change_likes_count(:+)
  redirect '/'
end

delete '/tweets/:tweet_id/like' do
  LikedTweet.find_by(user: current_user, tweet_id: params[:tweet_id]).destroy
  Tweet.find(params[:tweet_id]).change_likes_count(:-)
  redirect '/'
end


#RETWEET CREATE
post '/tweets/:tweet_id/retweets' do
  p params
  Tweet.create(
    user: current_user,
    original_tweet_id: params[:tweet_id],
    original_tweet_user_id: params[:original_tweet_user_id],
    tweet: "RETWEET"
  )
  Tweet.find(params[:tweet_id]).change_retweet_count(:+)
  redirect '/'
end

#RETWEET DELETE
                 #IMPORTANT
delete '/tweets/:tweet_id/retweets' do
  Tweet.find_by(user: current_user, original_tweet_id: params[:tweet_id].to_i).destroy
  Tweet.find(params[:tweet_id]).change_retweet_count(:-)
  redirect '/'
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


