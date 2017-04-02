class CreateRepliedTweets < ActiveRecord::Migration
  def change
    create_table :replied_tweets do |t|
      t.references :user
      t.references :original_tweet_id, references: :tweets
      t.references :replied_tweet_id, references: :tweets

      t.timestamps null: false
    end
  end
end
