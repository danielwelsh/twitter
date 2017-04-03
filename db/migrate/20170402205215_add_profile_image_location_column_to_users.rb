class AddProfileImageLocationColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile_image_location, :string
  end
end
