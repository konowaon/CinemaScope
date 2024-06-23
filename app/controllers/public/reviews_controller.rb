class Public::ReviewsController < ApplicationController
  # アクションの前に特定のメソッドを実行するためのコールバック
  before_action :set_movie
  before_action :set_review, only: %i[edit update destroy]
  before_action :authenticate_user!
  before_action :correct_user, only: %i[edit update destroy]
# レビューを作成するアクション
  def create
    @review = @movie.reviews.build(review_params)
    @review.user = current_user
    if @review.save# 成功した場合、映画の詳細ページにリダイレクトし、通知を表示
      redirect_to @movie, notice: 'レビューが投稿されました。'
    else# 失敗した場合、レビューの一覧を再取得し、映画の詳細ページを再表示
      @reviews = @movie.reviews.includes(:user)
      render 'public/movies/show'
    end
  end

  def edit
  end
# レビューを更新するアクション
  def update
    if @review.update(review_params)
      redirect_to @movie, notice: 'レビューが更新されました。'
    else
      render :edit
    end
  end
# レビューを削除するアクション
  def destroy
    @review.destroy
    redirect_to @movie, notice: 'レビューが削除されました。'
  end

  private
# 映画を設定するメソッド
  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
# レビューを設定するメソッド
  def set_review
    @review = @movie.reviews.find(params[:id])
  end
# レビューのパラメータを許可するメソッド
  def review_params
    params.require(:review).permit(:rating, :content)
  end
# 現在のユーザーがレビューの作成者であるか確認するメソッド
  def correct_user
    redirect_to @movie, alert: '権限がありません。' unless @review.user == current_user
  end
end