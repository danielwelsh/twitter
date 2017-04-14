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


gifs = ['https://media3.giphy.com/media/vjCkGbbSm7bhe/200.webp#0', 'https://media2.giphy.com/media/26uffuxTEnPIuUEDe/200w.webp#4', 'https://media1.giphy.com/media/3oKIPgv7sLSyOPOj3q/200.webp#5', 'https://media1.giphy.com/media/26xBTl5FatDYDuYwg/200.webp#12', 'https://media0.giphy.com/media/3o85xv0xDasZxrSreg/200.webp#30', 'https://media1.giphy.com/media/3oKIPyBmsz6zgYW5pK/200.webp#38', 'https://media1.giphy.com/media/l4FGjGwafkagUqj28/200.webp#39', 'https://media4.giphy.com/media/l4FGwsyl2CJewUXKM/200.webp#55', 'https://media1.giphy.com/media/26gR0ERFL1EL1qVpK/200.webp#62', 'https://media2.giphy.com/media/6jcmZhb1PhQqs/200.webp#60', 'https://media3.giphy.com/media/GDEvIrbfpatwI/200.webp#68', 'https://media3.giphy.com/media/JzOyy8vKMCwvK/200.webp#69', 'https://media2.giphy.com/media/xUPGctXqBPh2nB2yti/200.webp#74', 'https://media1.giphy.com/media/BsCyUEA9mtcyY/200.webp#92', 'https://media3.giphy.com/media/RCwOTgJidoMda/200.webp#104', 'https://media0.giphy.com/media/26gR0LCJtKCkQx7YA/200w.webp#119', 'https://media1.giphy.com/media/gIvDNynJ1pp0Q/200.webp#162', 'https://media4.giphy.com/media/iV8lQ1lJcp0wE/200.webp#197', 'https://media1.giphy.com/media/l0K3YVDzDjg3liwDK/200.webp#198', 'https://media.giphy.com/media/xUySTDROpTveu0l6GA/giphy.gif', 'https://media1.giphy.com/media/3oKIPrc2ngFZ6BTyww/200.webp#13', 'https://media0.giphy.com/media/26ufpQs92xxbTmpDa/200.webp#12', 'https://media2.giphy.com/media/3oKIPlcBgEjXVcxQqc/200.webp#18', 'https://media1.giphy.com/media/hku907iSSx1L2/200.webp#28', 'https://media3.giphy.com/media/3o7btV1sSvBaaSAQKc/200w.webp#32', 'https://media2.giphy.com/media/l0CRAsyQsXWKCZJU4/200.webp#34', 'https://media0.giphy.com/media/3osxYrQixUHdeOyyuA/200.webp#36', 'https://media1.giphy.com/media/l4FGGsvadZnh1qW76/200.webp#35', 'https://media4.giphy.com/media/3oKIPBHnPJgvhQbBwA/200.webp#45', 'https://media3.giphy.com/media/3oKIPfmldDngrD7pKw/200w.webp#48', 'https://media2.giphy.com/media/3oEjHNeRcPmluh7Igo/200.webp#56', 'https://media3.giphy.com/media/7s2Bbu6N5ud8s/200.webp#58', 'https://media3.giphy.com/media/XOXdQszYm4I3m/200.webp#60', 'https://media0.giphy.com/media/3o7btLTRe7LcNM2Nc4/200.webp#61', 'https://media1.giphy.com/media/R0jWWtH1CtFEk/200.webp#287', 'https://media3.giphy.com/media/3ohze3zRE6dbtRZeIo/200.webp#311', 'https://media3.giphy.com/media/l1KsqEEieWgzVbT5m/200.webp#315', 'https://media4.giphy.com/media/3ohuAg9135FQFL2Z3i/200.webp#330']


tweet_strings = ['We are on a mission #mission', 'The swag level is too high in this building #swag', 'How are we doing this right now #mission', 'Who is donald trump #potus', 'The sun is out today #sunny', 'The Edmonton Oilers are a great hockey team #oilers', 'The edmonton oilers will win game 2 #oilers', 'The wall is gonna be uuuge #wall #potus', 'I am writing this tweet from DBC ATM #DBC', 'May likes cats a lot #cats', 'Is anyone looking for a cat delivery service? #cats', 'Drake is the greatest of all time #greatest #drake', 'My Pokemon bring all the boys to the yard #pokemon', 'Superman is my favorite super hero #superman', 'I am hacking the internet #hackers', 'Quick, modify the code #hackers', 'Swordfish is the greatest movie of all time #hackers', 'We need to make it to the moon #moon #flying', 'Uber has gotten itself in some trouble #app #bad #sad', 'Expo markers are the best until the run out of ink #sad', 'My jet is not gassed up today #sad', 'Who wants to go for a coffee run right now! #coffee', 'I love food a lot #food #coffee', 'I will be running for president in 2020 #sad #wall', 'The weather today is quite nice #sunny', 'I just cant even right now #canteven', 'Who is up to go dancing! #dance #party #workit', 'Heading to the gym #summerbod', 'WWE SUPER SLAM TONIGHT. Be there or be square #square #wwe', 'John Cena is gonna put down tonight #wwe', 'I love the sweet life of ZACH AND CODY! #disney', 'I do not care what anyone else thinks, Frozen is the greatest movie of all time', 'I am passive aggressive and vent over twitter', 'I think stackoverflow is the greatest site of all time', 'Oh damn!', 'Going for a run', 'Does it concern you that Trump has the nuclear codes? #sad', 'Oops I did it again', 'The oilers are going to win the cup #hockey, #oilers', 'WORK WORK WORK #work', 'I love #dbc', 'I am going to eat a sandwich this weekend! It is going to be amazing #food', 'Gordan Ramsey scares me, but makes very good #food', 'Clutter is the greatest social media site of this century #social #media #great', 'Lets make clutter great again #clutter', 'Work grind sleep repeat! #go #team', 'I am getting a new cat this weekend any suggestions? #cats', 'The new MacBook Pro sucks hard core #apple #sad', 'Has anyone seen Hamilton? #great']


profile_pics = ['https://photos.peterhurley.com/sites/default/files/photos/2015/02/37/katrina%C2%A9peterhurley.jpg', 'http://www.colemanphotographix.com/wp-content/uploads/MensHeadshot-0016.jpg', 'https://static1.squarespace.com/static/53b599ebe4b08a2784696956/53c987b9e4b02a3a05287045/573e5642ab48dee8fdd818bc/1463704281105/professional-headshots-73.jpg', 'http://superninestudios.com/wp-content/uploads/2013/04/scott-eagle-electric-headshot.jpg', 'http://www.colemanphotographix.com/wp-content/uploads/TravisTaber-141.jpg', 'https://static1.squarespace.com/static/511526cde4b067782b69109c/517aa359e4b0ab81ac8d931c/517aa38ee4b0aef614c6765d/1366991895612/01-corporate-headshot-photo-130405-9660.JPG-1500px.JPG', 'https://dwppc-dwppcphotography.netdna-ssl.com/wp-content/uploads/galleries/post-2/Edgy%20Casual%20Headshot%20Outside%20On%20Brick%20Creative%20Lighting%20Raleigh%20NC.jpg', 'https://www.lensrentals.com/blog/media/2016/02/Cinematic-Headshots-1-650x520.jpg', 'https://static1.squarespace.com/static/51a6aa25e4b02ab2a15f7f58/t/5314302de4b0d2c243168551/1393831984016/actor-headshot-Jonathan_Yeomans-photo-by-Kevin_Patrick_Robbins-Hamilton-Toronto-Ontario-Canada.jpg', 'https://2d3z3x4e2xrx130kvm2hxdsp-wpengine.netdna-ssl.com/wp-content/gallery/youth-models/teen-headshot-teilor.jpg', 'https://s-media-cache-ak0.pinimg.com/originals/79/49/3e/79493e0d8c5a4876c2f071f8fd66e406.jpg', 'http://succeedasyourownboss.com/wp-content/uploads/2015/12/SBL_headshotCLOSEUP2016.jpg', 'https://static1.squarespace.com/static/511526cde4b067782b69109c/517aa359e4b0ab81ac8d931c/517aa396e4b041a7f26623d5/1366991956677/05-corporate-headshot-photo-WBEZ+-+Chicago+Public+Media_Edwards_Steve_Programming_120328_1210.psd.JPG-1500px.JPG', 'http://prod.images.vikings.clubs.nflcdn.com/image-web/NFL/CDA/data/deployed/prod/VIKINGS/assets/images/imported/MIN/photos/clubimages/2016/06-June/tempsendejo-andrew-2011-headshot--nfl_mezz_1280_1024.jpg?width=620&height=465', 'https://s-media-cache-ak0.pinimg.com/736x/4e/b6/ab/4eb6ab4ce56e5aa7b92b71861c6ebf23.jpg', 'https://bossip.files.wordpress.com/2013/03/michael-jordan1.jpg', 'http://i2.cdn.turner.com/cnnnext/dam/assets/160118134132-donald-trump-nigel-parry-full-169.jpg', 'http://cdn.blackenterprise.com/wp-content/blogs.dir/1/files/2014/08/HillaryClinton300232.jpg', 'https://i1.wp.com/indusbusinessjournal.com/wp-content/uploads/2016/01/Obama-Headshot.jpg', 'http://www.rapbasement.com/wp-content/uploads/2013/09/vibe-juice-2chainz.jpg', 'https://uproxx.files.wordpress.com/2016/12/50-cent-headshot.jpg?quality=90&w=450&h=315&crop=1', 'http://cdn.famefocus.com/wp-content/uploads/2015/10/justin-trudeau-headshot-1000x600.jpg', 'http://4.bp.blogspot.com/-NFfMOGDfvKQ/T50lhpkA2VI/AAAAAAAAFYw/dwqcMSBzIoU/s1600/Albert+Einstein+0.jpg', 'https://robertdall.com/wp-content/uploads/2011/10/steve-job-hs.png', 'http://positivepsychologynews.com/ppnd_wp/wp-content/uploads/2011/05/Oprah-head-shot.bmp', 'http://lh3.googleusercontent.com/--L5ufvKl-wk/Vc4mebEhhVI/AAAAAAAABa4/xnLvh7HdJs4/s640/Morgan-Freeman-Going-in-Style.jpg', 'http://i.huffpost.com/gen/1658294/images/o-OLIVIA-POPE-facebook.jpg', 'http://1lifecc.com/wp-content/uploads/horizontal-head-shot-black_grey-dress.jpg', 'http://harvardpolitics.com/blog/wp-content/uploads/2015/02/DP-Headshot-21.jpg', 'http://www.mypalmbeachpost.com/rf/image_lowres/Pub/p8/PalmBeachPost/2017/02/10/Images/newsEngin.17586741_viral-boynton-girl-dr-phil.jpg', 'http://runthetrap.com/wp-content/uploads/2017/01/Screen-Shot-2017-01-26-at-10.27.28-AM.png', 'https://d1w5usc88actyi.cloudfront.net/wp-content/uploads/2013/11/fstoppers_corporate_head_shot_Gary_martin-5.jpg', 'http://srkheadshotday.com/wp-content/uploads/Pablo_Gersberg_Headshot_16G8614_SQ1-760x507.jpg', 'http://www.exploretalent.info/wp-content/uploads/2016/06/headshots-nyc-new-york-city_lupita-nyongo-019.jpg', 'http://www.kennethlimheadshots.com/wp-content/uploads/2013/03/corporate-headshot-hong-kong-older-woman-white-background-1024x683.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_H2pcKQ1BanTlCi12Qvw3wl2OBsp97HmS8J0vZK9kUYJuHZKI', 'https://i.ytimg.com/vi/vgt9I_kpaHM/maxresdefault.jpg', 'http://www.sffilm.org/assets/images/EXHIBITION/2017%20SFIFF/Film%20stills%20and%20director%20headshots/SFFILM60_Headshot_SectionDetail_476x268.jpg', 'http://cdn.strategyonline.ca/wp/wp-content/uploads/2012/08/JPLacroix-head-shot-crop.jpg?8b5ab8', 'http://www.livingonehanded.com/wp-content/uploads/2012/09/Kyle-Scheele-Headshot.jpeg', 'http://www.jamieblack.com/JamieHeadShot05132006.jpg', 'http://i0.wp.com/pmcdeadline2.files.wordpress.com/2016/09/headshot_03.jpg?crop=152px%2C0px%2C896px%2C600px&resize=446%2C299&ssl=1', 'https://fortunedotcom.files.wordpress.com/2014/10/kevinsystrom-headshot.jpg?w=1100&quality=85', 'https://www.jpmorganchase.com/corporate/news/images/julia-bates-callout.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQE3yP2HYQaf3KZM7PBzj0CX51_4vz207dVXHRjeTRhY5chF01RWw', 'http://www.billgeorge.org/files/headshot-new.jpg', 'http://goodtoknow.media.ipcdigital.co.uk/111/00000acbc/97e7/jennifer-aniston-headshot.jpg']

background_pics = ['https://s-media-cache-ak0.pinimg.com/originals/8b/9d/25/8b9d25948d696ad1f5f27f25e64bb465.jpg','https://agbeat.com/wp-content/uploads/2012/10/twitter-cover.jpg', 'http://www.twitrcovers.com/wp-content/uploads/2012/09/Glasses-Cat.jpg', 'https://s-media-cache-ak0.pinimg.com/originals/11/85/42/1185427e8adc8f0cf93b509e604d6aa8.jpg', 'http://www.twitrcovers.com/wp-content/uploads/2012/09/Water-drops-glasses-l.jpg', 'http://www.twitrcover.com/wp-content/uploads/2013/11/London-twitter-header-9250-1070x535.jpg', 'http://www.twitrcovers.com/wp-content/uploads/2012/09/clouds-nature.jpg', 'https://agbeat.com/wp-content/uploads/2012/10/twitter-cover-photo-11.jpg', 'http://www.twitrcover.com/wp-content/uploads/2013/11/Landscapes-Autumn-Twitter-Header-635-520x260.jpg', 'http://www.twitrcovers.com/wp-content/uploads/2012/09/Police.jpg', 'http://www.twitrcovers.com/wp-content/uploads/2013/06/Colorful-Pencil-l.jpg', 'https://s-media-cache-ak0.pinimg.com/originals/1c/64/c2/1c64c25b533d17337878a99c65b04479.jpg', 'https://s-media-cache-ak0.pinimg.com/originals/0e/c7/f6/0ec7f6f1b8bfce2bbd59b66f2c5f0b8f.jpg', 'http://www.twitrcover.com/wp-content/uploads/2013/11/Dont-make-twitter-header-3607.jpg', 'https://s-media-cache-ak0.pinimg.com/originals/2a/cd/b1/2acdb1dc422f9707aedd084f7bfbb3db.jpg', 'http://www.twitrcovers.com/wp-content/uploads/2013/10/Boats-Sailing.jpg', 'http://logoinspirations.com/wp-content/uploads/2016/05/creativity-Cool-Twitter-Cover.jpg', 'https://agbeat.com/wp-content/uploads/2012/10/twitter-cover-photo-33.jpg', 'http://logoinspirations.com/wp-content/uploads/2016/05/Trippy-Weed-Background-Trippy-Twitter-cover.jpg', 'http://www.twitrcovers.com/wp-content/uploads/2012/09/New-York-City-s.jpg', 'http://www.twitrcovers.com/wp-content/uploads/2013/10/Technology-Digital-Art-l.jpg', 'http://static2.hypable.com/wp-content/uploads/2014/11/jk-rowling-twitter-cover-art-fix.jpg', 'http://www.twitcoversz.com/covers-images/download/Hatsune-Miku.jpg', 'http://www.bstcover.com/wp-content/uploads/2013/02/art-twitter-cover-photos.jpg', 'http://twitrheaders.com/wp-content/uploads/2014/05/Diamond.jpg', 'http://1.bp.blogspot.com/-A10lostVpmo/Vo6p470S47I/AAAAAAAAJMM/Klovs23ilLw/s1600/Twitter-Header-New-York-002.png', 'http://logoinspirations.com/wp-content/uploads/2016/05/Awesome-trees-Hipster-Twitter-Cover.jpg', 'http://www.twitrcover.com/wp-content/uploads/2013/11/bicycle-city-twitter-header-6137-1070x535.jpg', 'http://devfloat.net/wp-content/uploads/2016/01/Starfish-Twitter-Cover-Background.jpg', 'http://68.media.tumblr.com/60e59b6cf668572603bf9911ca59ce38/tumblr_inline_n3o3qfu2lP1spj4tq.png', 'http://twitrheaders.com/wp-content/uploads/2014/05/Lion-King-Hakuna-Matata.jpg', 'http://maxcdn.webappers.com/img/2013/05/Twitter-Covers-019.jpg', 'http://www.bstcover.com/wp-content/uploads/2013/06/rasta-black-wallpaper-twitter-cover-photos.jpg']
#Creating users
users = []
200.times do |index|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  profile_image = profile_pics.sample
  background_image = background_pics.sample
  user = User.new(first_name: first_name, last_name: last_name, handle: first_name, password: 123456, email: "#{first_name}@#{first_name}.com", profile_image_location: profile_image, profile_background_image_location: background_image)

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
  if tweet.save
    tweets << tweet
  end
end


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


