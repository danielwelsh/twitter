require 'date'
#Read all tags
get '/tags' do
   #Returns hash { tag_obj: number_of_occurrences}
  @trending_tags = Tag.get_trending_tags
  erb :'/tags/index'
end



#Show for a given tag
get '/tags/:tag_id' do
  num = params[:num_tweets].to_i
  @tag = Tag.find(params[:tag_id])
  @tweets = @tag.tweets

  #XHR needs to be implemented
  if request.xhr?
    content_type :html
    erb :'/tags/show', layout: false
  else
    erb :'/tags/show'
  end
end