require 'date'
#Read all tags
get '/tags' do
   #Returns hash { tag_obj: number_of_occurrences}
  @trending_tags = Tag.get_trending_tags
  erb :'/tags/index'
end


#Show for a given tag
get '/tags/:tag_id' do
  erb :'/tags/show'
end