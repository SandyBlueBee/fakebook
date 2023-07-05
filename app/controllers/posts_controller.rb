class PostsController < ApplicationController
  def create
    @user = current_user
    @post = Post.new(post_params)
    @post.user = @user
    if @post.save
      redirect_to profile_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
