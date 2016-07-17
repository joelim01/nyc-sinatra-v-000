class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures/new' do
    @figure = Figure.create(:name => params[:figure][:name])
    @figure.landmark_ids = params[:figure][:landmark_ids]
    @figure.title_ids = params[:figure][:title_ids]
    @landmark = Landmark.find_or_initialize_by(:name => params[:new_landmark])
    if @landmark.valid?
      @landmark.save
      @figure.landmarks << @landmark
    end
    @title = Title.find_or_initialize_by(:name => params[:new_title])
    if @title.valid?
      @title.save
      @figure.titles << @title
    end
    @figure.save
    redirect to :"/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @figure.name = params[:figure][:name]
    @figure.landmark_ids = params[:figure][:landmark_ids]
    @figure.title_ids = params[:figure][:title_ids]
    @landmark = Landmark.find_or_initialize_by(:name => params[:new_landmark])
    if @landmark.valid?
      @landmark.save
      @figure.landmarks << @landmark
    end
    @title = Title.find_or_initialize_by(:name => params[:new_title])
    if @title.valid?
      @title.save
      @figure.titles << @title
    end
    @figure.save
    redirect to :"/figures/#{@figure.id}"
  end


  get '/figures' do
    erb :'/figures/index'
  end
end
