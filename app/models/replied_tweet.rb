class RepliedTweet < ActiveRecord::Base
  belongs_to :tweet
  belongs_to :user
end
