require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt
  has_many :tweets
  has_many :followings
  has_many :followers, through: :followings, foreign_key: :following_id

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
end
