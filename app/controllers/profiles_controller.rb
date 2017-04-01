before do
  if !current_user
    erb :'index.erb'
  end
end

get '/' do
  @user = User.find(current_user.user_id)
  @tweets = @user.get_tweets_feed
  erb :'show.erb'
end


update '/like' do

end

update '/reply' do

end

update '/retweet' do

end