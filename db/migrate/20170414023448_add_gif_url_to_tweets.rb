class AddGifUrlToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :gif_url, :string
  end
end
