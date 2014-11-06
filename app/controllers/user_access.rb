
get "/login"  do
	erb :'users/signup'
end

post "/login" do
	@user = User.authenticate(params[:username], params[:password])
	if @user
		session[:username] = @user[:username]
		redirect '/'
	end
	erb :'/user/fail_login'
end

get '/signup' do
	erb :'user/signup'
end

post '/signup' do
	user = User.create(username: params[:username], password: params[:password])
	if user.new_record?
		@errors = user.errors.full_messages
		erb :'users/create', layout: false
	else
		session[:username] = params[:username]
		redirect '/'
	end
end

get '/logout' do
	session[:username] = nil
	redirect "/"
end

get '/users/:id' do
	@user = User.find(params[:id])
	erb :'user/profile'
end