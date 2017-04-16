class Tag < ActiveRecord::Base
  validates :tag, uniqueness: true

  has_many :tweet_tags
  has_many :tweets, through: :tweet_tags

  def self.get_trending_tags
    TweetTag.where("created_at < ? and created_at > ?", DateTime.now, DateTime.yesterday).group(:tag).limit(10).order('count_id desc').count(:id)
  end
end
