class AddNotNullValidationToTweet < ActiveRecord::Migration
  def change
    change_column_null :tweets, :tweet, false
  end
end
