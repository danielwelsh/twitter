

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
post 'tweets/:tweet_id/retweet' do
  #Create a new tweet and a retweet object
  original_tweet = Tweet.find(params[:tweet_id])
  Tweet.create(user: current_user, tweet: original_tweet.tweet, re )
  Retweet.create(user: current_user, )

end

delete 'tweets/:tweet_id/retweet' do

end




#LIKERS
get 'tweets/:tweet_id/likers' do

end



#REPLY
post 'tweets/:tweet_id/reply' do

end



