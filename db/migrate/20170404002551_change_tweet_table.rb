class ChangeTweetTable < ActiveRecord::Migration
  def change
    add_column :tweets, :original_tweet_id, :integer
    add_column :tweets, :likes_count, :integer, default: 0
    add_column :tweets, :retweet_count, :integer, default: 0
  end
end
