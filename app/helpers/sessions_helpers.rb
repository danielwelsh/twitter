def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
end

def login_user
  session[:user_id] = @user.id
end

def logout_user
  session[:user_id] = nil
end

def password_input_validation(password, password_confirmation)
  signup_errors = {}

  if password == "" && password_confirmation == ""
    signup_errors[:password] = ["Password fields cannot be blank"]
  end

  if password != password_confirmation
    signup_errors[:password] = ["Passwords don't match"]
  end

  if password.length < 6  || password_confirmation.length < 6
    signup_errors[:password] = ["Passwords must be 6 or more characters"]
  end

  signup_errors.length > 0 ? signup_errors : false
end

def profile_image_input_validation(params)
  signup_errors = {}
  if params[:profile_image]
    profile_image_hash = params[:profile_image]
    temp_file = profile_image_hash[:tempfile] # <Tempfile:/var/folders/_c/7cmjqt3d051475p3v8xl5dlr0000gn/T/..jpg>
    signup_errors[:profile_image] = ["Image cannot be greater than 3MB"] unless less_than_3mb?(temp_file)
  end
  signup_errors.length > 0 ? signup_errors : false
end
