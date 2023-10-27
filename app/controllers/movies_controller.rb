class MoviesController < ApplicationController
  before_action :set_movie, only: [:show]

  # GET /movies
  def index
    @movies = Movie.all
  end

  # GET /movies/:id
  def show
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
