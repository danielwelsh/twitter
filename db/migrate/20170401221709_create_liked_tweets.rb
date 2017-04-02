class CreateLikedTweets < ActiveRecord::Migration
  def change
    create_table :liked_tweets do |t|
      t.references :user
      t.references :tweet
    end
  end
end
