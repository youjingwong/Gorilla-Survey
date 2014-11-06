get '/surveys/new' do
	erb :'survey_creation/new'
end

post '/surveys' do
	survey = Survey.new
	survey.title = params[:title]
	survey.user_id = User.find_by(username: session[:username]).id
	survey.image_path  = params[:image]
	survey.save
	question = ""
	params.delete("title")
	params.delete("image")
	params.each do |key, value|
		value.each do |name, input|
			if name == "question"
				question = Question.create(body: input, survey_id: survey.id)
			else
				Choice.create(body: input, question_id: question.id)
			end
		end
	end
	redirect "/surveys/#{survey.id}"
end

get '/surveys/:id' do
	@survey = Survey.find(params[:id])
	erb :'survey_completion/survey_form'
end

# post'/surveys/:id/submit' do
# 	@user = User.find_by(username: username)
# 	if Surveys.find_by(user_id: @user.id == nil)
# 		params[choice].each do |question, choice|
# 			UserChoice.create(user_id: @user.id, choice_id: choice)
# 		end
# 	else
# 		erb :'errors/repeat'
# 	end
# 	@params = params
# 	erb :'test'

# end