get '/:handle' do
  if request.xhr
    @user = User.find_by(handle: params[:handle])
    erb :_hover_profile.erb
    # erb :_side_profile, locals: {current_user: @user}
  end
end


post '/hover/:handle' do
  @user = User.find_by(handle: params[:handle])
  if request.xhr?
    erb :'_hover_profile', layout:false, locals: {current_user: @user}
  end
end
