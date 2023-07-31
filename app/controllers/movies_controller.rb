class MoviesController < ApplicationController
  def index 
    @movies = Movie.all
  end

  def search_by_actor
    @query = params[:name]
    @actors = Actor.where("name LIKE ?", "%#{@query}%")
  end

end
