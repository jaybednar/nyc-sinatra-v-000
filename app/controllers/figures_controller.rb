class FiguresController < ApplicationController

	get '/figures' do 
		@figures = Figure.all 
		erb :'/figures/index'
	end 

	get '/figures/new' do 
		@landmarks = Landmark.all
		@titles = Title.all
		erb :'/figures/new' 
	end 

	post '/figures' do 
		# binding.pry
		if params[:title][:name] != "" 
			@new_title = Title.create(params[:title])
			if params[:figure][:title_ids]
				params[:figure][:title_ids] << @new_title.id 
			else 
				params[:figure][:title_ids] = @new_title.id 
			end 
		end 
		if params[:landmark][:name] != ""
			@new_landmark = Landmark.create(params[:landmark])
			if params[:figure][:landmark_ids]
				params[:figure][:landmark_ids] << @new_landmark.id 
			else 
				params[:figure][:landmark_ids] = @new_landmark.id
			end 
		end 
		@figure = Figure.create(params[:figure])
		# binding.pry
		redirect to "/figures/#{@figure.id}"
	end 

	get '/figures/:id' do 
		@figure = Figure.find(params[:id])
		erb :'figures/show' 
	end 

	get '/figures/:id/edit' do 
		@titles = Title.all 
		@landmarks = Landmark.all  
		@figure = Figure.find(params[:id])
		erb :'/figures/edit'
	end 

	post '/figures/:id' do 
		@figure = Figure.find(params[:id])
	# binding.pry
		if params[:title][:name] != "" 
			@new_title = Title.create(params[:title])
			if params[:figure][:title_ids]
				params[:figure][:title_ids] << @new_title.id 
			else 
				params[:figure][:title_ids] = @new_title.id 
			end 
		end 
		if params[:landmark][:name] != ""
			@new_landmark = Landmark.create(params[:landmark])
			if params[:figure][:landmark_ids]
				params[:figure][:landmark_ids] << @new_landmark.id 
			else 
				params[:figure][:landmark_ids] = @new_landmark.id
			end 
		end 
		@figure.update(params[:figure])
# binding.pry
		redirect to "/figures/#{@figure.id}"
	end 
end 