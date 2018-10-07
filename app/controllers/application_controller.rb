class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  #before_action :configure_permitted_parameters, if: :devise_controller?

  #protected
  #def configure_permitted_parameters
  #  devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :phone_no, :email, :password)}
  #  devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :phone_no, :email, :password, :current_password)}
  #end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:danger] = exception.message
    redirect_to root_path
  end
end
