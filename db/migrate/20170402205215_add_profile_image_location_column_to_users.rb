class AddProfileImageLocationColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile_image_location, :string, default: "/user_profile_images/default_profile_photo.png"
    add_column :users, :profile_background_image_location, :string, default: "/user_profile_images/default_background_photo.png"
  end
end
