class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  
  def after_sign_in_path_for(resource)
      root_path
    end
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

  # 以下を追加
end
