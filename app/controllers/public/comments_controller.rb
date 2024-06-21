module Public
  class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_movie

    def create
      @comment = @movie.comments.build(comment_params)
      @comment.user = current_user
      if @comment.save!
        redirect_to public_movie_path(@movie), notice: 'コメントが投稿されました。'
      else
        @comments = @movie.comments
        render 'public/movies/show'
      end
    end

    def destroy
      @comment = @movie.comments.find_by(id: params[:id])
      if @comment && @comment.user == current_user
        @comment.destroy
        redirect_to public_movie_path(@movie), notice: 'コメントが削除されました。'
      else
        redirect_to public_movie_path(@movie), alert: 'コメントの削除に失敗しました。'
      end
    end

    private

    def set_movie
      @movie = Movie.find(params[:movie_id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
  end
end