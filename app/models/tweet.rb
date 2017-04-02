class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :tweet_tags
  has_many :tags, through: :tweet_tags
  has_many :liked_tweets
  has_many :likes, through: :liked_tweets
  has_many :replied_tweets
  has_many :replies, through: :replied_tweets, foreign_key: :original_tweet_id
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



end
