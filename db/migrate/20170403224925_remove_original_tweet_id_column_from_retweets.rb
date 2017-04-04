class RemoveOriginalTweetIdColumnFromRetweets < ActiveRecord::Migration
  def change
    remove_column :retweets, :original_tweet_id
  end
end
