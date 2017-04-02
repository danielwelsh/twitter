class AddColumnsRepliedtoidToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :retweet_id, :integer
    remove_column :tweets, :likes
  end
end
