class Tweet < ActiveRecord::Base
  belongs_to :user #works
  has_many :tweet_tags #work
  has_many :tags, through: :tweet_tags # works
  has_many :liked_tweets # works; gives us back liked_tweet records
  has_many :likes, through: :liked_tweets, source: :user # works; gives us the users who liked the tweet
  has_many :replied_tweets, foreign_key: :replied_to_tweet_id #works: gives replied tweet objects
  has_many :replies, through: :replied_tweets, source: :tweet #works: gives tweets that are replies to the tweets
  has_many :retweets, foreign_key: :original_tweet_id #Returns a collections of retweet objects

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

  def get_nested_objects(self_association_method, pluck_field_sym, class_name)
    nested_objects_ids = self_association_method.pluck(pluck_field_sym)
    nested_objects_ids_string = nested_objects_ids.reduce('(') { |final_string, id| final_string + id.to_s + ','}.chop + ')'
    class_name.where("id in #{nested_objects_ids_string}")
  end

  def get_retweets
    get_nested_objects(self.retweets, :tweet_id, Tweet)
  end

  def likes_count
    self.likes.count
  end

  def liked?(user)
    id = user.id
    self.likes.where(id: id).count == 1
  end

  #Checks to see if the user has retweeted a given tweet
  def retweeted?(user)
    id = user.id
    self.retweets.where(id: id).count == 1
  end


  def retweet?(user)
    id = user.id
    self.retweets.count
  end

  def retweets_count
    self.retweets.count
  end

  def own_tweet?(user)
    self.user_id == user.id
  end
end
