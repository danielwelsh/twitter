class DropOldFollowings < ActiveRecord::Migration
  def change
    drop_table :followings
  end
end
