# To deliver this notification:
#
# MessageNotification.with(post: @post).deliver_later(current_user)
# MessageNotification.with(post: @post).deliver(current_user)

class MessageNotification < Noticed::Base
  deliver_by :database

  # notification = MessageNotification.with(message: @message)
  # notification.deliver(@user)
  # Add your delivery methods
  #
  # deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  # param :post

  # Define helper methods to make rendering easier.
  #

  def message
    "Vous avez une notification"
  end

end
