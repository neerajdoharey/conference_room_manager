class User::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :phone_no, :email, :password)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :phone_no, :email, :password, :current_password)}
  end
end
