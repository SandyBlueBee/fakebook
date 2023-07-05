class PagesController < ApplicationController
  before_action :authenticate_user!, only: :profile

  def home
    @users = User.all
    @feed = Post.all
    @user = current_user
    @post = Post.new
  end

  def profile
    if params[:format]
      @user = User.find(params[:format])
      @post = Post.new
    else
      @user = current_user
      @post = Post.new
    end
  end
end
