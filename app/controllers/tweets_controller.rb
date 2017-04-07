# ADD A TOTAL_TWEETS AND TOTAL_FOLLOWERS AND TOTAL_FOLLOWINGS for a user
require 'json'


post '/tweets/new' do
  @tweet = Tweet.new(user: current_user, tweet: params[:tweet])
  if @tweet.save
    redirect '/'
  else
    @tweets = current_user.get_landing_page_tweets
    @suggested_users = current_user.get_suggested_users
    @errors = @tweet.errors.full_messages
    @errors = @tweet.errors
    erb :'users/index'
  end
end

#LIKE
post '/tweets/:tweet_id/like' do

  LikedTweet.create(user: current_user, tweet_id: params[:tweet_id])
  likes = Tweet.find(params[:tweet_id]).change_likes_count(:+)
  json_package = {likes_count: likes, tweet_id: params[:tweet_id]}

  if request.xhr?
    json_package.to_json
  else
    redirect '/'
  end
end

delete '/tweets/:tweet_id/like' do
  LikedTweet.find_by(user: current_user, tweet_id: params[:tweet_id]).destroy
  Tweet.find(params[:tweet_id]).change_likes_count(:-)
  redirect '/'
end


#RETWEET CREATE
post '/tweets/:tweet_id/retweets' do
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
delete '/tweets/:tweet_id/retweets' do
  Tweet.find_by(user: current_user, original_tweet_id: params[:tweet_id].to_i).destroy
  Tweet.find(params[:tweet_id]).change_retweet_count(:-)
  redirect '/'
end

#REPLY
post 'tweets/:tweet_id/reply' do
end

#FOLLOW AND UNFOLLOW PEOPLE
post '/:handle/follow' do
  user_to_follow = User.find_by(handle: params[:handle])
  Follow.create(user_id: current_user.id, follow_id: user_to_follow.id)
  redirect '/'
end

delete '/:handle/follow'  do
  user_to_unfollow = User.find_by(handle: params[:handle])
  Follow.find_by(user_id: current_user.id, follow_id: user_to_unfollow.id).destroy
  redirect '/'
end


