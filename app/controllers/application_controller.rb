class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for resource
    dashboard_path
  end

  def after_sign_out_path_for resource
    root_path
  end

  protected
   def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address, :city,:state, :zip, :email, :password, :password_confirmation])
     devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :password_confirmation])
   end
end
