

#controller
get '/' do #/////// get: try to render /////////
  #active relation obejct
  @urls = Url.all.order(updated_at: :desc).limit(3)
  #show the code content in the index file 
  @error_message = ''
  erb :"static/index"
end

post '/urls' do #////// psot: try to redicrect for post ///////
  # taking out the Hash key's value out 
  long_url = params[:long_url]
  # create a Object for every new url's input
  @new_url = Url.new(long_url: long_url)

  # assigned the result of new_url to short_url 
  @new_url.shorten

  @urls= Url.all.order(updated_at: :desc).limit(3)

  # .save automatically check with <validates : > function in url.rb
  unless @new_url.save 
    @error_message = "Invalid URL input"
  end

   erb :"static/index"
  # go into result.erb then display the shortten_url result = locals: => local var
  
end

get '/:short_url' do
# since they are in the same object, 
# long_url could be found with the short_url attribute

  # b = Object,        key : value
  b = Url.find_by(short_url: params[:short_url])  
  
  count = b.counter.to_i
  # 0 = 0    # 1 = 1
  count += 1
  # 0 += 1   # 1 += 1 = 2
  b.counter = count
  # 0 = 1    # 2
  b.save

  redirect  b.long_url
end

get'/count' do
  @urls = Url.all
  #link back url to user
  erb :"static/count"
end