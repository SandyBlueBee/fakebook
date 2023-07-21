class MessagesController < ApplicationController

  after_action :notify_recipient, only: :create

  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
    ChatroomChannel.broadcast_to(
      @chatroom,
      render_to_string(partial: "message", locals: {message: @message})
    )
    head :ok
    # MessageNotification.with(message: "Un nouveau post a été créé !").deliver(current_user)
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  private

  def notify_recipient
    MessageNotification.with(message: "Un nouveau post a été créé !").deliver(current_user)
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
