module Public
  class CommentsController < ApplicationController
    # 任意のアクションの前にユーザーが認証されているか確認
    before_action :authenticate_user!
    # 任意のアクションの前に映画をセット
    before_action :set_movie

    def create
      # 映画に関連付けられた新しいコメントを作成
      @comment = @movie.comments.build(comment_params)
      # コメントに現在のユーザーを割り当て
      @comment.user = current_user
      # コメントの保存
      if @comment.save!
        redirect_to public_movie_path(@movie), notice: 'コメントが投稿されました。'
      else
        @comments = @movie.comments
        render 'public/movies/show'
      end
    end

    def destroy
      # 映画のコメントからidでコメントを探す
      @comment = @movie.comments.find_by(id: params[:id])
      # コメントが存在し、かつ現在のユーザーに属しているか確認
      if @comment && @comment.user == current_user
        @comment.destroy
        redirect_to public_movie_path(@movie), notice: 'コメントが削除されました。'
      else
        redirect_to public_movie_path(@movie), alert: 'コメントの削除に失敗しました。'
      end
    end

    private
    # 映画をparamsのmovie_idで設定
    def set_movie
      @movie = Movie.find(params[:movie_id])
    end
# コメント用のストロングパラメーター、contentのみを許可
    def comment_params
      params.require(:comment).permit(:content)
    end
  end
end