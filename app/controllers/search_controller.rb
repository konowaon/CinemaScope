class SearchController < ApplicationController
  def results
    if params[:query].present?
      @users = User.where("username LIKE ?", "%#{params[:query]}%")
      @movies = Movie.where("title LIKE ?", "%#{params[:query]}%")
      @genres = Genre.where("name LIKE ?", "%#{params[:query]}%")
    else
      @users = User.none
      @movies = Movie.none
      @genres = Genre.none
    end
  end
  
  def search
    @query = params[:query]
    @movies = Movie.where('title LIKE ?', "%#{@query}%")
    @genres = Genre.where('name LIKE ?', "%#{@query}%")
    @users = User.where('username LIKE ?', "%#{@query}%")

    render 'search/results'
  end
end