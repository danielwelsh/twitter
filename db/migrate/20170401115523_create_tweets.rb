class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.references :user
      t.string :tweet, limit: 140
      t.integer :likes, default: 0
      t.integer :reply_id

      t.timestamps null: false
    end
  end
end
