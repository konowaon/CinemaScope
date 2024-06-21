class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!  # 管理者認証
  def index
    @users = User.all
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
end
