require 'date'
#Read all tags
get '/tags' do
   #Returns hash { tag_obj: number_of_occurrences}
  popular_tags = TweetTag.where("created_at < ? and created_at > ?", DateTime.now, DateTime.yesterday).group(:tag).limit(10).order('count_id desc').count(:id)
  popular_tags
  erb :'/tags/index'
end


#Show for a given tag
get '/tags/:tag_id' do
  erb :'/tags/show'
end