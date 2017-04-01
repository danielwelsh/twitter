class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :tweet_tags
  has_many :tags, through: :tweet_tags
  after_create :parse_tags

  def parse_tags
    pattern = /#[a-z]{3,}/
    hash_tags = self.tweet.scan(pattern)
    hash_tags.each do |hash_tag|
      tag = Tag.create(tag: hash_tag)
      TweetTag.create(tweet: self, tag: tag)
    end
  end
end
