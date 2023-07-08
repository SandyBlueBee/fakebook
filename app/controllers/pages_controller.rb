class PagesController < ApplicationController
  before_action :authenticate_user!, only: :profile

  def home
    @users = User.all
    @posts = Post.all.sort_by { |post| post.created_at }.reverse
    @user = current_user
    @post = Post.new
    @comment = Comment.new
    @comment.post = @post
  end

  def profile
    @users = User.all
    @post = Post.new
    if params[:format]
      @user = User.find(params[:format])
    else
      @user = current_user
    end
    @posts = @user.posts.sort_by { |post| post.created_at }.reverse
    @comment = Comment.new
    @comment.post = @post
  end
end
