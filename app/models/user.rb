require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt
  has_many :tweets # works
  has_many :followings # works
  has_many :followers # works and returns followers objects
  has_many :liked_tweets #works and returned liked tweet objects
  has_many :replied_tweets #works and returns replied tweet objects
  # has_many :retweets, through: :tweets, foreign_key: :retweet_id #NEED TO CREATE A NEW TABLE, THEN TACKLE TAGS.
  has_many :retweets

  validates :first_name, :last_name, :handle, :email, :password_hash, presence:true
  validates :handle, :email, uniqueness: true
  before_save :capitalize_names

  def authenticate(input_password)
    self.password == input_password
  end

  def password
    @password ||= Password.new(self.password_hash)
  end

  def password=(new_password)
   @password = Password.create(new_password)
   self.password_hash = @password
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def capitalize_names
    self.first_name = self.first_name.capitalize
    self.last_name = self.last_name.capitalize
  end

  def landing_page_feed
    feed_user_ids = self.followings.pluck(:following_id) << self.id
    feed_user_ids_string = feed_user_ids.reduce('(') { |final_string, id| final_string + id.to_s + ',' }.chop + ')'
    all_tweets_ids = Tweet.where("user_id in #{feed_user_ids_string}").order(created_at: :desc).pluck(:tweet_id)
    all_retweets_ids = User.retweets.pluck(:tweet_id)
    all_tweets_ids - all_retweets_id
    # Tweet
  end

  def get_nested_objects(self_association_method, pluck_field_sym, class_name)
    nested_objects_ids = self_association_method.pluck(pluck_field_sym)
    nested_objects_ids_string = nested_objects_ids.reduce('(') { |final_string, id| final_string + id.to_s + ','}.chop + ')'
    class_name.where("id in #{nested_objects_ids_string}")
  end

  def get_followers
    get_nested_objects(self.followers, :follower_id, User)
  end

  def get_liked_tweets
    get_nested_objects(self.liked_tweets, :tweet_id, Tweet)
  end

  def get_replied_tweets
    get_nested_objects(self.replied_tweets, :tweet_id, Tweet)
  end

  def get_retweets
    get_nested_objects(self.retweets, :tweet_id, Tweet)
  end
end
