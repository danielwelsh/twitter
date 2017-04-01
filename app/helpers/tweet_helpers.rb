

def self.get_tweets_feed
 following = self.followings.pluck(:following_id) << self.id
 following_string = following.reduce('(') { |final_string, id| final_string + id.to_s + ',' }.chop + ')'
 Tweet.where("user_id in #{following_string}").order(created_at: :desc)
end
