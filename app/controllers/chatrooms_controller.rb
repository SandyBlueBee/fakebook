class ChatroomsController < ApplicationController
  before_action :authenticate_user!

  def show
    @chatroom = find_or_create_chatroom(params[:id])
    @messages = @chatroom.messages.order(created_at: :asc)
    @message = Message.new
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
  end
end
