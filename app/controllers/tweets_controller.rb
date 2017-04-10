# ADD A TOTAL_TWEETS AND TOTAL_FOLLOWERS AND TOTAL_FOLLOWINGS for a user
require 'json'


post '/tweets/new' do
  tweet = Tweet.new(user: current_user, tweet: params[:tweet])
  if tweet.save
    if request.xhr?
      erb :'/tweets/_tweet_create', layout: false, locals: { tweet: tweet}
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





#FIX ME AND REFACTOR INTO PARTIALS
#LIKE
post '/tweets/:tweet_id/like' do
  LikedTweet.create(user: current_user, tweet_id: params[:tweet_id])
  tweet = Tweet.find(params[:tweet_id])
  likes = tweet.change_likes_count(:+)

  if request.xhr?
    # Passing back the whole delete form
    %Q(<div class="like-functionality">
        <form  class="like-form" action="/tweets/#{tweet.id}/like" method="POST">
          <input type="hidden" name="_method" value="delete">
          <button class="liked-heart" type="submit">&#x2764;</button>
        </form>
        <a id="likes-count" href="">#{likes} </a>
      </div>
    )
  else
    redirect '/'
  end
end

delete '/tweets/:tweet_id/like' do
  LikedTweet.find_by(user: current_user, tweet_id: params[:tweet_id]).destroy
  tweet = Tweet.find(params[:tweet_id])
  likes = tweet.change_likes_count(:-)

  if request.xhr?
    # Passing back the whole delete form
    %Q(<div class="like-functionality">
        <form class="like-form" action="/tweets/#{tweet.id}/like" method="POST">
        <button type="submit">&#x2764;</button>
        </form>
        <a id="likes-count" href="">#{likes} </a>
      </div>
    )
  else
    redirect '/'
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
    erb :'tweets/_retweet_destroy', layout:false, locals: { tweet: original_tweet }
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
    erb :'tweets/_retweet_create', layout:false, locals: { tweet: original_tweet }
  else
    redirect '/'
  end
end





#REPLY
post 'tweets/:tweet_id/reply' do
end




#FOLLOW AND UNFOLLOW PEOPLE
post '/:handle/follow' do
  user_to_follow = User.find_by(handle: params[:handle])
  Follow.create(follower: current_user, followed_user: user_to_follow)
  redirect '/'
end

delete '/:handle/follow'  do
  user_to_unfollow = User.find_by(handle: params[:handle])
  Follow.find_by(follower: current_user, followed_user: user_to_unfollow).destroy
  redirect '/'
end


























