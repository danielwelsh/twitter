def get_tweets_feed(user)
 following = user.followings.pluck(:following_id) << user.id
 following_string = following.reduce('(') { |final_string, id| final_string + id.to_s + ',' }.chop + ')'
 Tweet.where("user_id in #{following_string}").order(created_at: :desc)
end

def parse_tweet_for_hashtags(tweet_string)
  pattern = /#[a-zA-Z]{3,}/
  tweet_string = tweet_string.gsub(pattern) { |hash_tag| %Q(<a class="hashtag-link" href="/tag/#{hash_tag}">#{hash_tag}</a>) }
end
