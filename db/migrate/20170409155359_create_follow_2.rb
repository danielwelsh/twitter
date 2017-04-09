class CreateFollow2 < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.references :follower
      t.references :followed_user

      t.timestamps(null: false)
    end
  end
end
