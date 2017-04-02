class CreateRepliedTweets < ActiveRecord::Migration
  def change
    create_table :replied_tweets do |t|
      t.references :user
      t.references :tweet
      t.integer :replied_to_tweet_id

      t.timestamps null: false
    end
  end
end
