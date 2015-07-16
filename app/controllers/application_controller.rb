class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(user)
    profile_view_path
  end

rescue_from Pundit::NotAuthorizedError do |exception|
  redirect_to new_user_session_path, alert: exception.message
end

  protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :phone, :password, :password_confirmation, :address, :role) }
        devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :phone, :address, :role) }
    end
end
