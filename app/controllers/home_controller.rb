class HomeController < ApplicationController
  def index
    @new_movies = Movie.where(category: 'new').order(created_at: :desc).limit(5)
    @popular_movies = Movie.where(category: 'popular').order(created_at: :desc).limit(5)
    @genres = Genre.includes(:movies)
  end
  
  def about
  end
  
end
