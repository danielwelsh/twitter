class AddColumnsRepliedtoidToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :retweet_id, :integer
    remove_column :tweets, :likes
  end
end


  def change
    create_table :tweets do |t|
      t.references :user
      t.string :tweet, limit: 140
      t.integer :reply_id

      t.timestamps null: false
    end