class Public::UsersController < ApplicationController
  # ユーザーがログインしていない場合、createアクション以外の全てのアクションに対して認証を要求
  before_action :authenticate_user!, except: [:create]
  # ユーザーが他のユーザーの編集や更新を防止するため、editとupdateアクションに対して正しいユーザーかどうかを確認
  before_action :correct_user, only: [:edit, :update]
  # 特定のユーザーを操作するための共通メソッド
  before_action :set_user, only: [:show, :edit, :update, :destroy]
# 特定のユーザーの詳細情報を表示する
  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.includes(:movie)
    @comments = @user.comments.includes(:movie)
  end
# ユーザー情報を編集する
  def edit
    @user = User.find(params[:id])
  end
# ユーザーを作成
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end
# ユーザー情報を更新
  def update
    if @user.update(user_params)
      redirect_to public_user_path(@user), notice: 'User was successfully updated.'
    else
      render :edit
    end
  end
# ユーザーを削除
  def destroy
    if current_user == @user
      @user.destroy
      redirect_to root_path, notice: 'User was successfully deleted.'
    else
      redirect_to root_path, alert: 'You are not authorized to perform this action.'
    end
  end

  private
# 正しいユーザーかどうかを確認
  def correct_user
    @user = User.find(params[:id])
    redirect_to public_user_path(current_user), alert: '他のユーザーの編集はできません。' unless @user == current_user
  end
# 特定のユーザーをセットするメソッド
  def set_user
    @user = User.find(params[:id])
  end
# ユーザーの許可されたパラメーターを指定
  def user_params
    params.require(:user).permit(:username, :email, :role)
  end
end