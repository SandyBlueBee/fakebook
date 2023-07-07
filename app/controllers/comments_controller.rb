class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = Post.find(params[:post_id])
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = 'You are not authorized to perform this action.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
