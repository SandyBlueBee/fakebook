class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :update_user_online, if: :user_signed_in?

  private

  def update_user_online
  current_user.try :touch
  end


  protected

  def configure_permitted_parameters
    attributes = [:avatar, :background_image, :post_image, :comment_image, :message_image]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end
end
