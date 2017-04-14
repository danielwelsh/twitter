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


gifs = ['https://media3.giphy.com/media/vjCkGbbSm7bhe/200.webp#0', 'https://media2.giphy.com/media/26uffuxTEnPIuUEDe/200w.webp#4', 'https://media1.giphy.com/media/3oKIPgv7sLSyOPOj3q/200.webp#5', 'https://media1.giphy.com/media/26xBTl5FatDYDuYwg/200.webp#12', 'https://media0.giphy.com/media/3o85xv0xDasZxrSreg/200.webp#30', 'https://media1.giphy.com/media/3oKIPyBmsz6zgYW5pK/200.webp#38', 'https://media1.giphy.com/media/l4FGjGwafkagUqj28/200.webp#39', 'https://media4.giphy.com/media/l4FGwsyl2CJewUXKM/200.webp#55', 'https://media1.giphy.com/media/26gR0ERFL1EL1qVpK/200.webp#62', 'https://media2.giphy.com/media/6jcmZhb1PhQqs/200.webp#60', 'https://media3.giphy.com/media/GDEvIrbfpatwI/200.webp#68', 'https://media3.giphy.com/media/JzOyy8vKMCwvK/200.webp#69', 'https://media2.giphy.com/media/xUPGctXqBPh2nB2yti/200.webp#74', 'https://media1.giphy.com/media/BsCyUEA9mtcyY/200.webp#92', 'https://media3.giphy.com/media/RCwOTgJidoMda/200.webp#104', 'https://media0.giphy.com/media/26gR0LCJtKCkQx7YA/200w.webp#119', 'https://media1.giphy.com/media/gIvDNynJ1pp0Q/200.webp#162', 'https://media4.giphy.com/media/iV8lQ1lJcp0wE/200.webp#197', 'https://media1.giphy.com/media/l0K3YVDzDjg3liwDK/200.webp#198']


tweet_strings = ['We are on a mission #mission', 'The swag level is too high in this building #swag', 'How are we doing this right now #mission', 'Who is donald trump #potus', 'The sun is out today #sunny', 'The Edmonton Oilers are a great hockey team #oilers', 'The edmonton oilers will win game 2 #oilers', 'The wall is gonna be uuuge #wall #potus', 'I am writing this tweet from DBC ATM #DBC', 'May likes cats a lot #cats', 'Is anyone looking for a cat delivery service? #cats', 'Drake is the greatest of all time #greatest #drake', 'My Pokemon bring all the boys to the yard #pokemon', 'Superman is my favorite super hero #superman', 'I am hacking the internet #hackers', 'Quick, modify the code #hackers', 'Swordfish is the greatest movie of all time #hackers', 'We need to make it to the moon #moon #flying', 'Uber has gotten itself in some trouble #app #bad #sad', 'Expo markers are the best until the run out of ink #sad', 'My jet is not gassed up today #sad', 'Who wants to go for a coffee run right now! #coffee', 'I love food a lot #food #coffee', 'I will be running for president in 2020 #sad #wall']


profile_pics = ['https://photos.peterhurley.com/sites/default/files/photos/2015/02/37/katrina%C2%A9peterhurley.jpg', 'http://www.colemanphotographix.com/wp-content/uploads/MensHeadshot-0016.jpg', 'https://static1.squarespace.com/static/53b599ebe4b08a2784696956/53c987b9e4b02a3a05287045/573e5642ab48dee8fdd818bc/1463704281105/professional-headshots-73.jpg', 'http://superninestudios.com/wp-content/uploads/2013/04/scott-eagle-electric-headshot.jpg', 'http://www.colemanphotographix.com/wp-content/uploads/TravisTaber-141.jpg', 'https://static1.squarespace.com/static/511526cde4b067782b69109c/517aa359e4b0ab81ac8d931c/517aa38ee4b0aef614c6765d/1366991895612/01-corporate-headshot-photo-130405-9660.JPG-1500px.JPG', 'https://dwppc-dwppcphotography.netdna-ssl.com/wp-content/uploads/galleries/post-2/Edgy%20Casual%20Headshot%20Outside%20On%20Brick%20Creative%20Lighting%20Raleigh%20NC.jpg', 'https://www.lensrentals.com/blog/media/2016/02/Cinematic-Headshots-1-650x520.jpg', 'https://static1.squarespace.com/static/51a6aa25e4b02ab2a15f7f58/t/5314302de4b0d2c243168551/1393831984016/actor-headshot-Jonathan_Yeomans-photo-by-Kevin_Patrick_Robbins-Hamilton-Toronto-Ontario-Canada.jpg', 'https://2d3z3x4e2xrx130kvm2hxdsp-wpengine.netdna-ssl.com/wp-content/gallery/youth-models/teen-headshot-teilor.jpg', 'https://s-media-cache-ak0.pinimg.com/originals/79/49/3e/79493e0d8c5a4876c2f071f8fd66e406.jpg', 'http://succeedasyourownboss.com/wp-content/uploads/2015/12/SBL_headshotCLOSEUP2016.jpg', 'https://static1.squarespace.com/static/511526cde4b067782b69109c/517aa359e4b0ab81ac8d931c/517aa396e4b041a7f26623d5/1366991956677/05-corporate-headshot-photo-WBEZ+-+Chicago+Public+Media_Edwards_Steve_Programming_120328_1210.psd.JPG-1500px.JPG', 'http://prod.images.vikings.clubs.nflcdn.com/image-web/NFL/CDA/data/deployed/prod/VIKINGS/assets/images/imported/MIN/photos/clubimages/2016/06-June/tempsendejo-andrew-2011-headshot--nfl_mezz_1280_1024.jpg?width=620&height=465', 'https://s-media-cache-ak0.pinimg.com/736x/4e/b6/ab/4eb6ab4ce56e5aa7b92b71861c6ebf23.jpg', 'https://bossip.files.wordpress.com/2013/03/michael-jordan1.jpg', 'http://i2.cdn.turner.com/cnnnext/dam/assets/160118134132-donald-trump-nigel-parry-full-169.jpg', 'http://cdn.blackenterprise.com/wp-content/blogs.dir/1/files/2014/08/HillaryClinton300232.jpg', 'https://i1.wp.com/indusbusinessjournal.com/wp-content/uploads/2016/01/Obama-Headshot.jpg', 'http://www.rapbasement.com/wp-content/uploads/2013/09/vibe-juice-2chainz.jpg', 'https://uproxx.files.wordpress.com/2016/12/50-cent-headshot.jpg?quality=90&w=450&h=315&crop=1', 'http://cdn.famefocus.com/wp-content/uploads/2015/10/justin-trudeau-headshot-1000x600.jpg', 'http://4.bp.blogspot.com/-NFfMOGDfvKQ/T50lhpkA2VI/AAAAAAAAFYw/dwqcMSBzIoU/s1600/Albert+Einstein+0.jpg', 'https://robertdall.com/wp-content/uploads/2011/10/steve-job-hs.png', 'http://positivepsychologynews.com/ppnd_wp/wp-content/uploads/2011/05/Oprah-head-shot.bmp']
#Creating users
users = []
200.times do |index|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  user = User.new(first_name: first_name, last_name: last_name, handle: first_name, password: 123456, email: "#{first_name}@#{first_name}.com")

  users << user if user.save
end


tweets = []
#Creating Tweets that belong to users
2000.times do |index|
  if rand(10) > 5
    gif_url = gifs.sample
  end
  user = users.sample
  tweet = tweet_strings.sample
  tweet = Tweet.new(user: user, tweet: tweet)
  tweet.gif_url = gif_url if gif_url
  tweets << tweet.save
end


retweets = []
#Creating Retweets
500.times do |index|
  user_who_retweeted = users.sample
  tweet_to_be_retweeted = tweets.sample
  Tweet.create!(tweet: "RETWEET", original_tweet_id: tweet_to_be_retweeted.id, original_tweet_user_id: tweet_to_be_retweeted.user_id, user: user_who_retweeted)
  tweet_to_be_retweeted.change_retweet_count(:+)
end



#Creating likes
1000.times do |index|
  user_who_liked = users.sample
  tweet_to_be_liked = tweets.sample
  LikedTweet.create(user: user_who_liked, tweet: tweet_to_be_liked)
  tweet_to_be_liked.change_likes_count(:+)
end



#Creating following relationships
2000.times do |index|
  Follow.create(follower: users.sample, followed_user: users.sample)
end


