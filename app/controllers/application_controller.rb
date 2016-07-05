class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:username, :password, :password_confirmation]
    devise_parameter_sanitizer.permit :sign_in, keys: [:username, :password, :password_confirmation]
  end

end
