class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.references :user
      t.integer :follower_id, null: false

      t.timestamps null: false
    end
  end
end
