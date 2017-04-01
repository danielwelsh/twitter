class CreateTweetTags < ActiveRecord::Migration
  def change
    create_table :tweet_tags do |t|
      t.references :tweet
      t.references :tag

      t.timestamps null: false
    end
  end
end
