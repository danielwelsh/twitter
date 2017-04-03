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
# tom2 = User.new(handle: 'tom2', email: 'tom2@tom2.com', password: 'tom2tom2', first_name: 'tom2', last_name: 'tom2')
# tom2.save!
# tom3 = User.new(handle: 'tom3', email: 'tom3@tom3.com', password: 'tom3tom3', first_name: 'tom3', last_name: 'tom3')
# tom3.save!

User.all.each do |user|
  10.times do
    tweet = Tweet.new(tweet: Faker::Hacker.say_something_smart, user: user)
    tweet.save!
    tweet2 = Tweet.new(tweet: "hashtags galore #this #that #blessed #yomomma #up", user: user)
    tweet2.save!
  end
end

#CREATING RETWEETS  #THE TWEET SECTIONS SHOULD REALLY BE HOLING AN OBJECT #FIXME
Tweet.new(tweet: "hashtags galore #this #that #blessed #yomomma #up", user: tom)

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


Retweet.new(user: tom, original_tweet_id: 25, tweet: Tweet.create(tweet: Tweet.find(25).tweet, user: tom)).save
Retweet.new(user: tom1, original_tweet_id: 12, tweet: Tweet.create(tweet: Tweet.find(12).tweet, user: tom1)).save


