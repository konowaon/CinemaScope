class Public::ReviewsController < ApplicationController
  before_action :set_movie
  before_action :set_review, only: %i[edit update destroy]
  before_action :authenticate_user!
  before_action :correct_user, only: %i[edit update destroy]

  def create
    @review = @movie.reviews.build(review_params)
    @review.user = current_user
    if @review.save
      redirect_to @movie, notice: 'レビューが投稿されました。'
    else
      @reviews = @movie.reviews.includes(:user)
      render 'public/movies/show'
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to @movie, notice: 'レビューが更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to @movie, notice: 'レビューが削除されました。'
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def set_review
    @review = @movie.reviews.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end

  def correct_user
    redirect_to @movie, alert: '権限がありません。' unless @review.user == current_user
  end
end