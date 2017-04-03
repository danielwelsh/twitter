#TWEET
post '/tweets/create' do
  @tweet = Tweet.new(user: current_user, tweet: params[:tweet])
  @suggested_users = User.all
  p '*' * 100
  p @suggested_users
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



