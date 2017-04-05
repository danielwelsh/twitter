class AddOriginalUserIdToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :original_tweet_user_id, :integer
  end
end
