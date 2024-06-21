class Admin::MoviesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :set_genres, only: [:new, :create, :edit, :update]

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to admin_movie_path(@movie), notice: '映画が正常に投稿されました。'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      redirect_to admin_movie_path(@movie), notice: '映画が正常に更新されました。'
    else
      render :edit
    end
  end
  
  def destroy
    @movie.destroy
    redirect_to admin_movies_path, notice: '映画が正常に削除されました。'
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def set_genres
    @genres = Genre.all
  end

  def movie_params
    params.require(:movie).permit(:title, :description, :release_date, :rating, :genre_id, :image, :category)
  end
end