# require 'faker'

# User.all.destroy_all
# Tweet.all.destroy_all
# Following.all.destroy_all
# Tag.all.destroy_all
# TweetTag.all.destroy_all
# LikedTweet.all.destroy_all
# RepliedTweet.all.destroy_all
# Follower.all.destroy_all
# Retweet.all.destroy_all

# tom = User.new(handle: 'tom', email: 'tom@tom.com', password: 'tomtom', first_name: 'tom', last_name: 'tom')
# tom.save!
# tom1 = User.new(handle: 'tom1', email: 'tom1@tom1.com', password: 'tom1tom1', first_name: 'tom1', last_name: 'tom1')
# tom1.save!

# User.all.each do |user|
#   10.times do
#     tweet = Tweet.new(tweet: Faker::Hacker.say_something_smart, user: user)
#     tweet.save!
#     tweet2 = Tweet.new(tweet: "hashtags galore #this #that #blessed #yomomma #up", user: user)
#     tweet2.save!
#   end
# end

# #RETWEETS
# Tweet.new(tweet: "RETWEET", original_tweet_id: 1, original_tweet_user_id:1, user: tom1).save
# Tweet.new(tweet: "RETWEET", original_tweet_id: 26, original_tweet_user_id:2, user: tom).save

# Following.new(user:tom, following_id: tom1.id).save
# # Following.new(user:tom, following_id:tom3.id).save
# # Following.new(user:tom3, following_id:tom.id).save
# Following.new(user:tom1, following_id: tom.id).save

# Follower.new(user:tom, follower_id: tom1.id).save
# Follower.new(user:tom1, follower_id: tom.id).save

# LikedTweet.new(user: tom, tweet: Tweet.find(21)).save
# LikedTweet.new(user: tom, tweet: Tweet.find(22)).save
# LikedTweet.new(user: tom, tweet: Tweet.find(23)).save
# LikedTweet.new(user: tom, tweet: Tweet.find(24)).save
# LikedTweet.new(user: tom, tweet: Tweet.find(25)).save
# LikedTweet.new(user: tom, tweet: Tweet.find(26)).save


# LikedTweet.new(user: tom1, tweet: Tweet.find(1)).save
# LikedTweet.new(user: tom1, tweet: Tweet.find(2)).save
# LikedTweet.new(user: tom1, tweet: Tweet.find(3)).save
# LikedTweet.new(user: tom1, tweet: Tweet.find(4)).save
# LikedTweet.new(user: tom1, tweet: Tweet.find(5)).save
# LikedTweet.new(user: tom1, tweet: Tweet.find(6)).save


# #LEARN: CHECK TO SEE IF THERE IS A WAY TO PLACE OBJECTS IN HERE INSTEAD
# RepliedTweet.new(user: tom, tweet: Tweet.create(tweet: Faker::Hacker.say_something_smart, user: tom), replied_to_tweet_id: 22).save
# RepliedTweet.new(user: tom, tweet: Tweet.create(tweet: Faker::Hacker.say_something_smart, user: tom), replied_to_tweet_id: 23).save

# RepliedTweet.new(user: tom1, tweet: Tweet.create(tweet: Faker::Hacker.say_something_smart, user: tom1), replied_to_tweet_id: 8).save
# RepliedTweet.new(user: tom1, tweet: Tweet.create(tweet: Faker::Hacker.say_something_smart, user: tom1), replied_to_tweet_id: 9).save
require 'faker'



tweet_strings = ['We are on a mission #mission', 'The swag level is too high in this building #swag', 'How are we doing this right now #mission', 'Who is donald trump #potus', 'The sun is out today #sunny', 'The Edmonton Oilers are a great hockey team #oilers', 'The edmonton oilers will win game 2 #oilers', 'The wall is gonna be uuuge #wall #potus', 'I am writing this tweet from DBC ATM #DBC', 'May likes cats a lot #cats', 'Is anyone looking for a cat delivery service? #cats', 'Drake is the greatest of all time #greatest #drake', 'My Pokemon bring all the boys to the yard #pokemon', 'Superman is my favorite super hero #superman', 'I am hacking the internet #hackers', 'Quick, modify the code #hackers', 'Swordfish is the greatest movie of all time #hackers', 'We need to make it to the moon #moon #flying', 'Uber has gotten itself in some trouble #app #bad #sad', 'Expo markers are the best until the run out of ink #sad', 'My jet is not gassed up today #sad', 'Who wants to go for a coffee run right now! #coffee', 'I love food a lot #food #coffee', 'I will be running for president in 2020 #sad #wall']

#Creating users
users = []
200.times do |index|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  users << User.create(first_name: first_name, last_name: last_name, handle: first_name, password: 123456, email: "#{first_name}@#{first_name}.com")
end


tweets = []
#Creating Tweets that belong to users
2000.times do |index|
  tweets << Tweet.create(user: users.sample, tweet: tweet_strings.sample)
end


retweets = []
#Creating Retweets
500.times do |index|
  user_who_retweeted = users.sample
  tweet_to_be_retweeted = tweets.sample
  Tweet.create(original_tweet_id: tweet_to_be_retweeted.id, original_tweet_user_id: tweet_to_be_retweeted.user_id, user: user_who_retweeted)
end



#Creating likes
1000.times do |index|
  user_who_liked = users.sample
  tweet_to_be_liked = tweets.sample
  LikedTweet.create(user: user_who_liked, tweet: tweet_to_be_liked)
end



#Creating following relationships
2000.times do |index|
  Follow.create(follower: users.sample, followed_user: users.sample)
end


