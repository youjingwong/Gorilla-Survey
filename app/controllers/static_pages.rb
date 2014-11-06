configure do	
	enable :sessions
end

helpers do
	def login?
	  !!session[:username]
	end

	def username
		session[:username]
	end
end


get '/' do
  @surveys = Survey.all.reverse
  erb :home
end

get '/test' do
	erb :test
end
