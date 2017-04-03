class RemoveRetweetsIdFromTweets < ActiveRecord::Migration
  def change
    remove_column :tweets, :retweet_id
  end
end
