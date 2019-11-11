class MoviesController < ApplicationController
  before_action :set_movie, only: [:show]

  # GET /movies
  # GET /movies.json
  def index
    if params[:search].present?
      @search = params[:search]
      @movies = Movie.where('lower(actor) LIKE (?)', "%#{@search.downcase}%").all
    else
      @movies = Movie.all
    end
  end

  def show
  end

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

end
