class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :configure_permitted_parameters, if: :devise_controller?
  private
  def after_sign_in_path_for(resource)
      root_path
    end
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
