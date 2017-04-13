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



tweets = ['We are on a mission #mission', 'The swag level is too high in this building #swag', 'How are we doing this right now #mission', 'Who is donald trump #potus', 'The sun is out today #sunny', 'The Edmonton Oilers are a great hockey team #oilers', 'The edmonton oilers will win game 2 #oilers', 'The wall is gonna be uuuge #wall #potus', 'I am writing this tweet from DBC ATM #DBC', 'May likes cats a lot #cats', 'Is anyone looking for a cat delivery service? #cats', 'Drake is the greatest of all time #greatest #drake', 'My Pokemon bring all the boys to the yard #pokemon', 'Superman is my favorite super hero #superman', 'I am hacking the internet #hackers', 'Quick, modify the code #hackers', 'Swordfish is the greatest movie of all time #hackers', 'We need to make it to the moon #moon #flying', 'Uber has gotten itself in some trouble #app #bad #sad', 'Expo markers are the best until the run out of ink #sad', 'My jet is not gassed up today #sad', 'Who wants to go for a coffee run right now! #coffee', 'I love food a lot #food #coffee', 'I will be running for president in 2020 #sad #wall']

#Creating users


jimmy = User.create(handle: "jimmy", first_name: "jimmy", last_name: "welsh", email: "jimmy@jimmy.com", password: "123456")


bobby = User.create(handle: "bobby", first_name: "bobby", last_name: "welsh", email: "bobby@bobby.com", password: "123456")
moe = User.create(handle: "moe", first_name: "moe", last_name: "welsh", email: "moe@moe.com", password: "123456")

#Tweet create
Tweet.create(user: jimmy, tweet: "This is a tweet #swag #winning")
Tweet.create(user: jimmy, tweet: "This is a tweet that has #swag")
Tweet.create(user: jimmy, tweet: "This is another tweet with the same hastags #swag #winning")
Tweet.create(user: bobby, tweet: "Tweet made by another person #winning")
Tweet.create(user: bobby, tweet: "Tweet made by another person #swag")



#moe follows id 2
Follow.create(follower: jimmy, followed_user: bobby)
Follow.create(follower: jimmy, followed_user: moe)

# 2 follows 1
Follow.create(follower: moe, followed_user: jimmy)



