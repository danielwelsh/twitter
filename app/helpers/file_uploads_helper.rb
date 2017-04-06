def less_than_3mb?(file)
  File.size?(file) <= 1024*1024*3
end

def uploads_file(params, user)
  filename = params[:profile_image][:filename]
  temp_file = params[:profile_image][:tempfile]

  target = "#{APP_ROOT}/public/user_profile_images/#{user.id}_#{filename}"
  File.open(target, "wb") {|f| f.write temp_file.read }

  user.profile_image_location = "/user_profile_images/#{user.id}_#{filename}"
  user.save
end
