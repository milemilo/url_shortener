get '/' do
	@urls = Url.all
  # Look in app/views/index.erb
  erb :index
end

post '/urls' do
@urls = Url.all
Url.create(generate_short_url(params))
redirect '/'
end

get '/:short_url' do
	#redirect to proper long url
	# click count must be incremented by one each time clicked
	 Url.find_by_short_url(params[:short_url]).clicked!
  redirect Url.find_by_short_url(params[:short_url]).url

end