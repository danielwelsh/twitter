require 'faker'

User.all.destroy_all
Tweet.all.destroy_all
Following.all.destroy_all
Tag.all.destroy_all
TweetTag.all.destroy_all

tom = User.new(handle: 'tom', email: 'tom@tom.com', password: 'tomtom', first_name: 'tom', last_name: 'tom')
tom.save!
tom1 = User.new(handle: 'tom1', email: 'tom1@tom1.com', password: 'tom1tom1', first_name: 'tom1', last_name: 'tom1')
tom1.save!
tom2 = User.new(handle: 'tom2', email: 'tom2@tom2.com', password: 'tom2tom2', first_name: 'tom2', last_name: 'tom2')
tom2.save!
tom3 = User.new(handle: 'tom3', email: 'tom3@tom3.com', password: 'tom3tom3', first_name: 'tom3', last_name: 'tom3')
tom3.save!

User.all.each do |user|
  10.times do
    tweet = Tweet.new(tweet: Faker::Hacker.say_something_smart, user: user)
    tweet.save!
    tweet2 = Tweet.new(tweet: "hashtags galore #this #that #blessed #yomomma #up", user: user)
    tweet2.save!
  end
end

Following.new(user:tom, following_id:tom2.id).save
Following.new(user:tom, following_id:tom3.id).save
Following.new(user:tom3, following_id:tom.id).save
Following.new(user:tom2, following_id:tom.id).save

