class RenameFollowsColumns < ActiveRecord::Migration
  def change
    drop_table :follows
  end
end



