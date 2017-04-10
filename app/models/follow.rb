class Follow < ActiveRecord::Base
  belongs_to :follower, class_name: 'User', foreign_key: :follower_id, inverse_of: :follows
  belongs_to :followed_user, class_name: 'User', foreign_key: 'followed_user_id', inverse_of: :following
end
