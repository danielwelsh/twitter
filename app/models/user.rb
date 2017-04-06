require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt
  has_many :tweets # works, doesn't include retweets
  has_many :follows
  has_many :followings, :through => :follows, :source => :user #Returns user objects of who the user is following
  has_many :inverse_follows, :class_name => "Follow", :foreign_key => "follow_id"
  has_many :followers, :through => :inverse_follows, :source => :user #Returns user objects of who the user follows
  has_many :liked_tweets #works and returned liked tweet objects
  has_many :replied_tweets #works and returns replied tweet objects

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

  def get_landing_page_tweets
    #get the user's tweets that are not retweets
    own_tweets = []
    if self.get_tweets_count > 0
      own_tweets = self.tweets.where(original_tweet_id: nil).order(id: :desc)
    end

    #get the user's followings tweets
    filtered_followings_tweets = []
    followings_user_ids = self.followings.pluck(:follow_id)

    if followings_user_ids.length > 0
      ids_string = followings_user_ids.reduce('(') { |final_string, id| final_string + id.to_s + ','}.chop + ")"
      followings_tweets = Tweet.where("user_id in #{ids_string}")

      #remove all retweets where user is already following that person ##working
      filtered_followings_tweets = followings_tweets.where(
        "original_tweet_id is null or (original_tweet_id is not null and original_tweet_user_id not in #{ids_string})").order(id: :desc)
    end
    p '*' * 50
    p own_tweets + filtered_followings_tweets
    own_tweets + filtered_followings_tweets
  end

  def profile_page_feed
    self.tweets
  end

  def get_nested_objects(self_association_method, pluck_field_sym, class_name)
    nested_objects_ids = self_association_method.pluck(pluck_field_sym)
    nested_objects_ids_string = nested_objects_ids.reduce('(') { |final_string, id| final_string + id.to_s + ','}.chop + ')'
    class_name.where("id in #{nested_objects_ids_string}")
  end

  def get_liked_tweets
    get_nested_objects(self.liked_tweets, :tweet_id, Tweet)
  end

  def get_replied_tweets
    get_nested_objects(self.replied_tweets, :tweet_id, Tweet)
  end

  def get_tweets_count
    self.tweets.count
  end

  def get_followings_count
    self.followings.count
  end

  def get_followers_count
    self.followers.count
  end

  ## START -- FUNCTIONALITY FOR SUGGESTING USERS TO FOLLOW
  def get_following_ids_string
    following_ids = self.followings.pluck(:follow_id) << self.id
    following_ids.reduce('(') { |final_string, id| final_string + id.to_s + ','}.chop + ')'
  end

  def get_suggested_users
    User.all.where("id not in #{self.get_following_ids_string}")
  end
  ## END -- FUNCTIONALITY FOR SUGGESTING USERS TO FOLLOW


end
