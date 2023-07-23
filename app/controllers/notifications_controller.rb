class NotificationsController < ApplicationController
# display all notifications for the current user
  def index
    @notifications = current_user.notifications.order(created_at: :desc)
  end
end
