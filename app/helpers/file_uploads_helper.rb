helpers do

  def less_than_3mb?(file)
    File.size?(file) <= 1024000000
  end

  def copy_file(temp_file, filename)
    target = "#{APP_ROOT}/public/user_profile_images/#{current_user.id}_#{filename}"
    File.open(target, "wb") {|f| f.write temp_file.read }
    current_user.profile_image_location = "/user_profile_images/#{current_user.id}_#{filename}"
    current_user.save
  end
end
