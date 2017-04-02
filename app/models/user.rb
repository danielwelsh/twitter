require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt
  has_many :tweets
  has_many :followings
  has_many :followers, through: :followings, foreign_key: :following_id
  has_many :liked_tweets
  has_many :replied_tweets
  has_many :replies, through: :replied_tweets
  has_many :retweets, through: :tweets, foreign_key: :retweet_id
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

end
