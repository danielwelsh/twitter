class CreateRetweets < ActiveRecord::Migration
  def change
    create_table :retweets do |t|
      t.references :user
      t.references :tweet
      t.integer :original_tweet_id

      t.timestamps null: false
    end
  end
end
