class Admin::ReviewsController < Admin::BaseController
  before_action :set_user, only: :index
  before_action :set_review, only: :destroy

  def index
    @reviews = if params[:user_id]
                 User.find(params[:user_id]).reviews
               else
                 Review.all
               end
  end

  def destroy
    @review.destroy
    redirect_to admin_reviews_path, notice: 'レビューが削除されました。'
  end

  private

  def set_user
    @user = User.find(params[:user_id]) if params[:user_id]
  end

  def set_review
    @review = Review.find(params[:id])
  end
end