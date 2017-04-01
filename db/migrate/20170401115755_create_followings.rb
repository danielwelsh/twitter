class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :following do |t|
      t.references :user
      t.string :following_id

      t.timestamps null: false
    end
  end
end
