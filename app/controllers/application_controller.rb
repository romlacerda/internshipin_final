class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
 protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  def after_sign_in_path_for(resource)
  	dashboard_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar, :email, :cpf, :nome, :sobrenome])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
  end
end
