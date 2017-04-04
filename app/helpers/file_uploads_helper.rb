helpers do

  def less_than_3mb?(file)
    File.size?(file) <= 1024*1024*3
  end

  def copy_file(params)
    filename = params[:profile_image][:filename]
    temp_file = params[:profile_image][:tempfile]

    target = "#{APP_ROOT}/public/user_profile_images/#{current_user.id}_#{filename}"
    File.open(target, "wb") {|f| f.write temp_file.read }

    current_user.profile_image_location = "/user_profile_images/#{current_user.id}_#{filename}"
    current_user.save
  end
end
