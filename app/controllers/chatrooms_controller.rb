class ChatroomsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    @chatrooms = current_user.chatrooms
    @chatroom = @chatrooms.joins(:users).where(users: { id: params[:user_id] }).first
    user = User.find(params[:user_id])

    unless @chatroom.present?
      @chatroom = Chatroom.create
      @chatroom.users << current_user
      @chatroom.users << user
    end

    @messages = @chatroom.messages.order(created_at: :asc)

    render json: { partial: render_to_string(partial: "chatrooms/messages", locals: { chatroom: @chatroom, user: user }, formats: :html)}, status: :created
  end

  private

  def find_or_create_chatroom(user_id)
    current_user_chatrooms = current_user.chatrooms
    other_user_chatrooms = User.find(user_id).chatrooms
    common_chatrooms = current_user_chatrooms & other_user_chatrooms

    if common_chatrooms.present?
      common_chatrooms.first
    else
      chatroom = Chatroom.create
      chatroom.users << current_user
      chatroom.users << User.find(user_id)
      chatroom
    end
    # raise
  end
end
