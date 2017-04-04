class AddColumnForBackgroundImageToUsers < ActiveRecord::Migration
  def change
    change_column_default :users, :profile_image_location, "/user_profile_images/default_profile_photo.png"
    add_column :users, :profile_background_image_location, :string, default: "/user_profile_images/default_background_photo.png"
  end
end
