class Public::CommentsController < ApplicationController
  def index
  end

  def show
  end

  def create
    @review = Review.find(params[:review_id])
    @comment = @review.comments.create(comment_params.merge(user: current_user))
    redirect_to review_path(@review)
  end

  def update
  end

  def destroy
  end
  
  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
