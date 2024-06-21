class Public::MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @comments = @movie.comments
    @comment = Comment.new
  end
end
