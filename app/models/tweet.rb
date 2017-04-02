class Tweet < ActiveRecord::Base
  belongs_to :user #works
  has_many :tweet_tags #work
  has_many :tags, through: :tweet_tags # works
  has_many :liked_tweets # works; gives us back liked_tweet records
  has_many :likes, through: :liked_tweets, source: :user # works; gives us the users who liked the tweet
  has_many :replied_tweets, foreign_key: :replied_to_tweet_id #works: gives replied tweet objects
  has_many :replies, through: :replied_tweets, source: :tweet #works: gives tweets that are replies to the tweets

  validates :tweet, length: { maximum: 140, minimum: 1 }
  after_create :parse_tags

  def date
    self.created_at.to_date
  end

  def parse_tags
    pattern = /#[a-z]{3,}/
    hash_tags = self.tweet.scan(pattern)
    hash_tags.each do |hash_tag|
      tag = Tag.find_by(tag: hash_tag)
      if tag
        tag.save # update the timestamps
      else
        tag = Tag.create(tag: hash_tag)
      end
      TweetTag.create(tweet: self, tag: tag)
    end
  end

  def total_likes
    self.likes.count
  end
end
