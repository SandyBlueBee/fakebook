class PostsController < ApplicationController
  def create
    @user = current_user
    @post = Post.new(post_params)
    @post.user = @user
    if @post.save
      redirect_to root_path, notice: 'Comment created successfully.'
    else
      flash[:alert] = 'You are not authorized to perform this action.'
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
