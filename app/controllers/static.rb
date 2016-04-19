#controller
get '/' do
  #show the code content in the index file 
  erb :"static/index", locals: { url: '' }
end

post '/urls' do
  # taking out the Hash key's value out 
  long_url = params[:long_url]
  # create a Object for every new url's input
  new_url = Url.new(long_url: long_url)
  # assigned the result of new_url to short_url 
  new_url.shorten
  new_url.save

  # go into result.erb then display the shortten_url result = locals: => local var
  erb :"static/index", locals: { url: new_url.short_url }
end

get '/:short_url' do
# since they are in the same object, 
# long_url could be found with the short_url attribute

  # b = Object,        key : value
  b = Url.find_by(short_url: params[:short_url])  
  
  count = b.counter.to_i
  count += 1
  b.counter = count
  b.save

  redirect "http://" + b.long_url
end
