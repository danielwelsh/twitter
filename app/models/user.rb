require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt
  #Notes on self referential relationships http://nithinbekal.com/posts/complex-has-many-through/ https://www.youtube.com/watch?v=5sfufoY59Ek
  has_many :tweets # works, doesn't include retweets
  has_many :follows, foreign_key: :follower_id, inverse_of: :follower
  has_many :followed_users, through: :follows, source: :followed_user #Who you are following
  has_many :following, class_name: "Follow", foreign_key: :followed_user_id, inverse_of: :followed_user
  has_many :following_users, through: :following, source: :follower #Who is following you
  has_many :followed_tweets, through: :followed_users #Not fully tested for functionality
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
    followings_user_ids = self.followed_users.pluck(:id)

    if followings_user_ids.length > 0
      ids_string = followings_user_ids.reduce('(') { |final_string, id| final_string + id.to_s + ','}.chop + ")"
      followings_tweets = Tweet.where("user_id in #{ids_string}")

      #remove all retweets where user is already following that person ##working
      filtered_followings_tweets = followings_tweets.where(
        "original_tweet_id is null or (original_tweet_id is not null and original_tweet_user_id not in #{ids_string})").order(id: :desc)
    end
    own_tweets + filtered_followings_tweets
  end

  def get_profile_page_tweets
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
    self.followed_users.count
  end

  def get_followers_count
    self.following_users.count
  end

  ## START -- FUNCTIONALITY FOR SUGGESTING USERS TO FOLLOW
  def get_following_ids_string
    following_ids = self.followed_users.pluck(:id) << self.id
    following_ids.reduce('(') { |final_string, id| final_string + id.to_s + ','}.chop + ')'
  end

  def get_suggested_users
    User.all.where("id not in #{self.get_following_ids_string}")
  end
  ## END -- FUNCTIONALITY FOR SUGGESTING USERS TO FOLLOW


end
