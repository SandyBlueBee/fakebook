class PagesController < ApplicationController
  before_action :authenticate_user!, only: :profile

  def home
    @users = User.all
  end

  def profile
    if params[:format]
      @user = User.find(params[:format])
    else
      @user = current_user
    end
  end
end
