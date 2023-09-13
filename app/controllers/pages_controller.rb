class PagesController < ApplicationController
  before_action :authenticate_user!

  protect_from_forgery with: :exception


  def index
    @pages = Page.all
    @users = User.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    @user = current_user
    @page = Page.new(page_params)
    @page.user = @user
    if @page.save
      redirect_to page_path(@page), notice: 'Comment created successfully.'
    else
      flash[:alert] = 'You are not authorized to perform this action.'
    end
  end

  def home
    # left side bar
    @pages = Page.all

    # content
    @users = User.all
    @posts = Post.all.sort_by { |post| post.created_at }.reverse
    @user = current_user
    @post = Post.new

    @comment = Comment.new
    @comment.post = @post
    @like = Like.new
    @like.user = current_user

    # right side bar
    @chatrooms = current_user.chatrooms
    @chatroom = @chatrooms.joins(:users).where(users: { id: params[:user_id] }).first


    @notifications = current_user.notifications.order(created_at: :desc)
    @notifications_by_user = {}

    @users.each do |user|
      if user == current_user
        @notifications_by_user[user.id] = 0
      else
        @notifications_by_user[user.id] = current_user.notifications.unread.select { |notification| notification.params[:sender].id == user.id }.count
      end
    end
  end

  def mark_as_read
    # @notifications.update_all(read_at: Time.zone.now)
    # select notifications unread by current user and mark them as read
    @users = User.all
    # current_user.notifications.unread.select{_1.params[:sender] == User.find(9)}
    user_sender = User.find(params[:user_id])

    # On recuperer toutes les notifications qui m'ont été envoyées par l'utilisateur
    all_notifications_sender = current_user.notifications.unread.select do |notification|
      notification.params[:sender] == user_sender
    end

    # On les marque comme lues
    all_notifications_sender.each do |notification|
      notification.mark_as_read!
    end

    respond_to do |format|
      format.json do
        response = { success: true, user_sender_id: user_sender.id }
        render json: response
      end
    end
  end


  def profile
    @users = User.all
    @post = Post.new
    if params[:format]
      @user = User.find(params[:format])
      @chatroom = Chatroom.find_by(id: params[:chatroom_id])

    else
      @user = current_user
      @chatroom = Chatroom.find_by(id: params[:chatroom_id])
    end
    @posts = @user.posts.sort_by { |post| post.created_at }.reverse
    @comment = Comment.new
    @comment.post = @post
  end

  private

  def page_params
    params.require(:page).permit(:name, :bio, :avatar, :background_image, :category)
  end
end
