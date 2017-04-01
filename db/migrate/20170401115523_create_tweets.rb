class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.references :user
      t.string :tweet, limit: {length: 140}
      t.integer :likes, null: false
      t.integer :reply_id

      t.timestamps null: false
    end
  end
end
