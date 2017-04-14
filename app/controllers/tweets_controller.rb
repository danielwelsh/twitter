# ADD A TOTAL_TWEETS AND TOTAL_FOLLOWERS AND TOTAL_FOLLOWINGS for a user
require 'json'

get '/tweets' do
  @tweets = current_user.get_landing_page_tweets
end

post '/tweets' do
  @tweet = Tweet.new(user: current_user, tweet: params[:tweet])
  if @tweet.save
    if request.xhr?
      erb :'/tweets/show', layout: false, locals: { tweet: @tweet}
    else
      redirect '/'
    end
  else
    @tweets = current_user.get_landing_page_tweets
    @suggested_users = current_user.get_suggested_users
    @errors = @tweet.errors.full_messages
    @errors = @tweet.errors
    # FIXME This should probably redirect to route instead
    erb :'users/index'
  end

end


#LIKE
post '/tweets/:tweet_id/like' do
  LikedTweet.create(user: current_user, tweet_id: params[:tweet_id])
  @tweet = Tweet.find(params[:tweet_id])
  @tweet.change_likes_count(:+)

  if request.xhr?
    erb :'tweets/_like_form', layout: false, locals: {tweet: @tweet}
  else
    redirect '/'
  end
end

delete '/tweets/:tweet_id/like' do
  LikedTweet.find_by(user: current_user, tweet_id: params[:tweet_id]).destroy
  @tweet = Tweet.find(params[:tweet_id])
  @tweet.change_likes_count(:-)

  if request.xhr?
    erb :'tweets/_like_form', layout: false,  locals: {tweet: @tweet}
  else
    redirect '/'
  end
end


#GET users who have retweeted a tweet
get '/tweets/:tweet_id/retweets' do
  @users = Tweet.find(params[:tweet_id]).retweeted_by
  p @users
  if request.xhr?
    erb :'users/_list_users', layout: false
  else
    erb :'/users/_list_users'
  end
end


#RETWEET CREATE
post '/tweets/:tweet_id/retweets' do

  Tweet.create(
    user: current_user,
    original_tweet_id: params[:tweet_id],
    original_tweet_user_id: params[:original_tweet_user_id],
    tweet: "RETWEET"
  )

  original_tweet = Tweet.find(params[:tweet_id])
  original_tweet.change_retweet_count(:+)

  if request.xhr?
    erb :'tweets/_retweet_form', layout:false, locals: { tweet: original_tweet }
  else
    redirect '/'
  end
end

#RETWEET DELETE
delete '/tweets/:tweet_id/retweets' do
  Tweet.find_by(
    user: current_user,
    original_tweet_id: params[:tweet_id]
    ).destroy

  Tweet.find(params[:tweet_id]).change_retweet_count(:-)

  original_tweet = Tweet.find(params[:tweet_id])

  if request.xhr?
    erb :'tweets/_retweet_form', layout:false, locals: { tweet: original_tweet }
  else
    redirect '/'
  end
end



#Get users who have liked a tweet
get '/tweets/:tweet_id/likes' do
  @users = Tweet.find(params[:tweet_id]).likes
  if request.xhr?
    erb :'/users/_list_users', layout: false
  else
    erb :'/users/_list_users'
  end
end




#REPLY
post 'tweets/:tweet_id/reply' do
end




























