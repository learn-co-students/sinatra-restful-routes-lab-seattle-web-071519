require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/' do
    redirect to ("/recipes")
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :recipes
  end

  get '/recipes/new' do
    @recipe = Recipe.new
    erb :new
  end

  post '/recipes' do
    # binding.pry
    @recipe = Recipe.create(params)
    redirect to ("/recipes/#{@recipe.id}")
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end


  #update
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  #get the input from the edit form - 
  patch '/recipes/:id' do
    @recipe = Recipe.update(params[:recipe])
    redirect to ("/recipes/#{@recipe.id}")
  end

  #delete stuff
  delete '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    Recipe.all.delete(@recipe.id)
  end


end
