require 'faker'

User.all.destroy_all
Tweet.all.destroy_all
Following.all.destroy_all
Tag.all.destroy_all
TweetTag.all.destroy_all
LikedTweet.all.destroy_all
RepliedTweet.all.destroy_all
Follower.all.destroy_all
Retweet.all.destroy_all

tom = User.new(handle: 'tom', email: 'tom@tom.com', password: 'tomtom', first_name: 'tom', last_name: 'tom')
tom.save!
tom1 = User.new(handle: 'tom1', email: 'tom1@tom1.com', password: 'tom1tom1', first_name: 'tom1', last_name: 'tom1')
tom1.save!

User.all.each do |user|
  10.times do
    tweet = Tweet.new(tweet: Faker::Hacker.say_something_smart, user: user)
    tweet.save!
    tweet2 = Tweet.new(tweet: "hashtags galore #this #that #blessed #yomomma #up", user: user)
    tweet2.save!
  end
end

#RETWEETS
Tweet.new(tweet: "RETWEET", original_tweet_id: 1, original_tweet_user_id:1, user: tom1).save
Tweet.new(tweet: "RETWEET", original_tweet_id: 26, original_tweet_user_id:2, user: tom).save

Following.new(user:tom, following_id: tom1.id).save
# Following.new(user:tom, following_id:tom3.id).save
# Following.new(user:tom3, following_id:tom.id).save
Following.new(user:tom1, following_id: tom.id).save

Follower.new(user:tom, follower_id: tom1.id).save
Follower.new(user:tom1, follower_id: tom.id).save

LikedTweet.new(user: tom, tweet: Tweet.find(21)).save
LikedTweet.new(user: tom, tweet: Tweet.find(22)).save
LikedTweet.new(user: tom, tweet: Tweet.find(23)).save
LikedTweet.new(user: tom, tweet: Tweet.find(24)).save
LikedTweet.new(user: tom, tweet: Tweet.find(25)).save
LikedTweet.new(user: tom, tweet: Tweet.find(26)).save


LikedTweet.new(user: tom1, tweet: Tweet.find(1)).save
LikedTweet.new(user: tom1, tweet: Tweet.find(2)).save
LikedTweet.new(user: tom1, tweet: Tweet.find(3)).save
LikedTweet.new(user: tom1, tweet: Tweet.find(4)).save
LikedTweet.new(user: tom1, tweet: Tweet.find(5)).save
LikedTweet.new(user: tom1, tweet: Tweet.find(6)).save


#LEARN: CHECK TO SEE IF THERE IS A WAY TO PLACE OBJECTS IN HERE INSTEAD
RepliedTweet.new(user: tom, tweet: Tweet.create(tweet: Faker::Hacker.say_something_smart, user: tom), replied_to_tweet_id: 22).save
RepliedTweet.new(user: tom, tweet: Tweet.create(tweet: Faker::Hacker.say_something_smart, user: tom), replied_to_tweet_id: 23).save

RepliedTweet.new(user: tom1, tweet: Tweet.create(tweet: Faker::Hacker.say_something_smart, user: tom1), replied_to_tweet_id: 8).save
RepliedTweet.new(user: tom1, tweet: Tweet.create(tweet: Faker::Hacker.say_something_smart, user: tom1), replied_to_tweet_id: 9).save

