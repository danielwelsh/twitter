class Tweet < ActiveRecord::Base
  belongs_to :user #works
  has_many :tweet_tags #work
  has_many :tags, through: :tweet_tags # works
  has_many :liked_tweets # works; gives us back liked_tweet records
  has_many :likes, through: :liked_tweets, source: :user # works; gives us the users who liked the tweet
  has_many :replied_tweets, foreign_key: :replied_to_tweet_id #works: gives replied tweet objects
  has_many :replies, through: :replied_tweets, source: :tweet #works: gives tweets that are replies to the tweets
  # has_many :retweets


  validates :tweet, length: { in: (2...140) }
  after_create :parse_tags


#TWEET FUNCTIONALITY
  # used on retweets to get the original tweet
  def get_original_tweet
    original_tweet_id = self.original_tweet_id
    Tweet.find(original_tweet_id) if original_tweet_id
  end

  # used to display dates in _tweets view
  def date
    self.created_at.to_date
  end

  # parses tweets for tags and adds them to the tags and tweets_tags table
  def parse_tags
    pattern = /#[a-zA-Z]{3,}/
    hash_tags = self.tweet.scan(pattern)
    hash_tags.each do |hash_tag|
      tag = Tag.create(tag: hash_tag)
      TweetTag.create(tweet: self, tag: tag)
    end
  end

  def liked?(user)
    id = user.id
    self.likes.where(id: id).count == 1
  end

  # used to determine if a tweet is a user's own tweet
  def own_tweet?(user)
    self.user_id == user.id
  end

  def change_likes_count(operator)
    self.likes_count = self.likes_count.send(operator, 1)
    self.save
    self.likes_count
  end



#RETWEET FUNCTIONALITY
  # #Checks to see if user retweeted a given tweet
  def retweeted_by_self?(user)
    Tweet.all.where(user_id: user.id, original_tweet_id: self.id).count == 1
  end

  # checks if tweet is a retweet
  def retweet?
    self.original_tweet_id != nil
  end

  def change_retweet_count(operator)
    self.retweet_count = self.retweet_count.send(operator, 1)
    self.save
    self.retweet_count
  end

  def retweeted_by
    @tweets = Tweet.all.where(original_tweet_id: self.id)
    @users = []
    @tweets.each do |tweet|
      @users << tweet.user
    end
    @users
  end
end



























