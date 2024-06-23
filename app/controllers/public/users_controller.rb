class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:create]
  before_action :correct_user, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.includes(:movie)
    @comments = @user.comments.includes(:movie)
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to public_user_path(@user), notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    # ユーザーの削除権限のチェックを追加する必要があります
    if current_user == @user
      @user.destroy
      redirect_to root_path, notice: 'User was successfully deleted.'
    else
      redirect_to root_path, alert: 'You are not authorized to perform this action.'
    end
  end

  private

  def correct_user
    @user = User.find(params[:id])
    redirect_to public_user_path(current_user), alert: '他のユーザーの編集はできません。' unless @user == current_user
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :role)
  end
end