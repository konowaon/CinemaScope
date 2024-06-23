class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!  # 管理者認証
  before_action :set_user, only: %i[show destroy]
  def index
    @users = User.all
    @reviews = Review.includes(:movie).where(user_id: @users)
  end

  def show
    @user = User.find(params[:id])
    @comments = @user.comments.includes(:movie)
  end

  def create
  end

  def update
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: 'ユーザーが削除されました。'
  end
  
  private

  def set_user
    @user = User.find(params[:id])
  end
end
