class HomeController < ApplicationController
  def index
    @latest_reviews = Review.order(created_at: :desc).limit(5)
    @popular_movies = Movie.order(rating: :desc).limit(5)
    @categories = Genre.all
  end
  
  def about
  end
  
end
