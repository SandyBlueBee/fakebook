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

  def like
    @post = Post.all.find(params[:like][:likeable_id])
    @like = Like.create(user: current_user, likeable_type: "Post", likeable_id: @post.id )
    redirect_to root_path
  end

  def unlike
    @like = Like.all.find(params[:format])
    @like.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:content, :post_image)
  end
end
