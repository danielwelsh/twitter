require 'date'
#Read all tags
get '/tags' do
  TweetTag.where("created_at < ? and created_at > ?", DateTime.now, DateTime.yesterday).group(:tag_id).count
  erb :'/tags/index'
end


#Show for a given tag
get '/tags/:tag_id' do
  erb :'/tags/show'
end