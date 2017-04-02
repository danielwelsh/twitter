class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :following do |t|
      t.references :user
      t.integer :following_id

      t.timestamps null: false
    end
  end
end
