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

  def like
    @comment = Comment.all.find(params[:like][:likeable_id])
    @like = Like.create(user: current_user, likeable_type: "Comment", likeable_id: @comment.id )
    redirect_to root_path
  end

  def unlike
    @like = Like.all.find(params[:format])
    @like.destroy
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :comment_image)
  end
end
