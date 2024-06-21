class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_back(fallback_location: admin_user_path(@comment.user), notice: 'コメントを削除しました。')
  end
end
