class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]


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

  def edit
    if current_user == @post.user
    else
      flash[:alert] = 'You are not authorized to perform this action.'
      redirect_to root_path
    end
  end

  # def edit
  #   if current_user == @post.user
  #     respond_to do |format|
  #       format.html # render the edit template for non-AJAX requests
  #       format.js   # handle the AJAX request for edit
  #     end
  #   else
  #     flash[:alert] = 'You are not authorized to perform this action.'
  #     redirect_to root_path
  #   end
  # end


  def update
    if current_user == @post.user
      if @post.update(post_params)
        redirect_to root_path, notice: 'The post was successfully updated.'
      else
        render :edit
      end
    else
      flash[:alert] = 'You are not authorized to perform this action.'
      redirect_to root_path
    end
  end

  def destroy
    if current_user == @post.user
      @post.destroy
      redirect_to root_path, notice: 'The post was successfully deleted.'
    else
      flash[:alert] = 'You are not authorized to perform this action.'
      redirect_to root_path
    end
  end


  private

  def post_params
    params.require(:post).permit(:content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
